#!/bin/bash
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"
NAME="openlist-runsv"
OUT_DIR="$PROJECT_DIR/out"
SUPPORTED_ABIS=(arm64-v8a armeabi-v7a x86_64 x86)
VARIANTS=(nomount mount)
BINARY=openlist
# service/ is assembled per variant (common files + the variant's run script).
COMMON_FILES=(META-INF customize.sh uninstall.sh action.sh module.prop)

# Where the committed update/<channel>/<variant>/<abi>.json metadata is served from.
# Kept in sync with publish-update.sh so the URL baked into module.prop
# resolves to the matching file.
REPO_SLUG="${REPO_SLUG:-sorubedo/openlist-magisk-runsv}"
RAW_BASE="${RAW_BASE:-https://raw.githubusercontent.com/$REPO_SLUG/main}"

usage() {
    echo "Usage: $0 [arm64-v8a|armeabi-v7a|x86_64|x86 ...]"
    echo "With no ABI arguments, packages all supported ABIs separately."
}

is_supported_abi() {
    local candidate="$1"
    local supported
    for supported in "${SUPPORTED_ABIS[@]}"; do
        [ "$candidate" = "$supported" ] && return 0
    done
    return 1
}

# Effective module version: prefer the fetched upstream version, fall back to
# the values committed in module.prop for local/dev builds.
if [ -f "$OUT_DIR/upstream-versions.env" ]; then
    # shellcheck disable=SC1091
    source "$OUT_DIR/upstream-versions.env"
    VERSION="${OPENLIST_VERSION:?missing OPENLIST_VERSION in upstream-versions.env}"
    VERSION_CODE="${OPENLIST_VERSION_CODE:?missing OPENLIST_VERSION_CODE}"
    CHANNEL="${MODULE_CHANNEL:-unknown}"
else
    VERSION="$(sed -n 's/^version=//p' "$PROJECT_DIR/module.prop")"
    VERSION_CODE="$(sed -n 's/^versionCode=//p' "$PROJECT_DIR/module.prop")"
    CHANNEL="local"
fi

# Replace name/description/version/versionCode/updateJson in a staged
# module.prop, keeping line order. updateJson is appended when a URL is given
# and the file has none.
stamp_module_prop() {
    local file="$1" update_url="${2:-}" disp_name="$3" disp_desc="$4" tmp="$1.tmp"
    while IFS= read -r line; do
        case "$line" in
            name=*) echo "name=$disp_name" ;;
            description=*) echo "description=$disp_desc" ;;
            version=*) echo "version=$VERSION" ;;
            versionCode=*) echo "versionCode=$VERSION_CODE" ;;
            updateJson=*)
                if [ -n "$update_url" ]; then
                    echo "updateJson=$update_url"
                fi
                ;;
            *) echo "$line" ;;
        esac
    done < "$file" > "$tmp"
    if [ -n "$update_url" ] && ! grep -q '^updateJson=' "$tmp"; then
        echo "updateJson=$update_url" >> "$tmp"
    fi
    mv "$tmp" "$file"
}

# Human readable name/description per variant, stamped into module.prop.
variant_metadata() {
    case "$1" in
        mount)
            VARIANT_NAME="openlist (runsv, mount)"
            VARIANT_DESC="OpenList as a runsv service. Core binary is shipped in the module and mounted at /system/bin/openlist (system mount); runs as the shell user and keeps its data on shared storage."
            ;;
        *)
            VARIANT_NAME="openlist (runsv, no-mount)"
            VARIANT_DESC="OpenList as a runsv service. Core binary lives in the service folder (no system mount) and runs as root with its data in ./data."
            ;;
    esac
}

if [ "${1:-}" = "--help" ] || [ "${1:-}" = "-h" ]; then
    usage
    exit 0
fi

if [ "$#" -gt 0 ]; then
    ABIS=("$@")
else
    ABIS=("${SUPPORTED_ABIS[@]}")
fi

for ABI in "${ABIS[@]}"; do
    if ! is_supported_abi "$ABI"; then
        echo "ERROR: unsupported ABI: $ABI" >&2
        usage >&2
        exit 1
    fi
done

mkdir -p "$OUT_DIR"
PACKAGES=()

echo "=> Module version: $VERSION (versionCode $VERSION_CODE, $CHANNEL)"

for VARIANT in "${VARIANTS[@]}"; do
    variant_metadata "$VARIANT"
    for ABI in "${ABIS[@]}"; do
        if [ ! -f "$PROJECT_DIR/bin/$ABI/$BINARY" ]; then
            echo "ERROR: missing bin/$ABI/$BINARY; run fetch.sh first" >&2
            exit 1
        fi

        STAGE_DIR="$(mktemp -d)"
        trap 'rm -rf "$STAGE_DIR"' EXIT

        for path in "${COMMON_FILES[@]}"; do
            cp -a "$PROJECT_DIR/$path" "$STAGE_DIR/"
        done
        chmod 755 "$STAGE_DIR/META-INF/com/google/android/update-binary"
        chmod 755 "$STAGE_DIR/customize.sh" "$STAGE_DIR/uninstall.sh" "$STAGE_DIR/action.sh"

        # Assemble the service/openlist tree. It is the single source of truth
        # the installer merges into the service folder, so it carries the
        # shared files, this variant's run/conf, the nomount binary and the
        # default "down" (autostart disabled) marker.
        mkdir -p "$STAGE_DIR/service/openlist/log"
        cp -a "$PROJECT_DIR/service/common/finish" "$STAGE_DIR/service/openlist/finish"
        cp -a "$PROJECT_DIR/service/common/log/run" "$STAGE_DIR/service/openlist/log/run"
        cp -a "$PROJECT_DIR/service/common/down" "$STAGE_DIR/service/openlist/down"
        cp -a "$PROJECT_DIR/service/$VARIANT/run" "$STAGE_DIR/service/openlist/run"
        cp -a "$PROJECT_DIR/service/$VARIANT/conf" "$STAGE_DIR/service/openlist/conf"
        chmod 755 "$STAGE_DIR/service/openlist/run" \
            "$STAGE_DIR/service/openlist/finish" \
            "$STAGE_DIR/service/openlist/log/run"
        chmod 644 "$STAGE_DIR/service/openlist/conf" "$STAGE_DIR/service/openlist/down"

        # nomount: ship the binary inside the service tree so a plain merge
        # refreshes it too. mount: ship it as the module's system payload so the
        # manager mounts it at /system/bin/openlist.
        if [ "$VARIANT" = "mount" ]; then
            mkdir -p "$STAGE_DIR/system/bin"
            cp -a "$PROJECT_DIR/bin/$ABI/$BINARY" "$STAGE_DIR/system/bin/"
            chmod 755 "$STAGE_DIR/system/bin/$BINARY"
        else
            mkdir -p "$STAGE_DIR/service/openlist/bin"
            cp -a "$PROJECT_DIR/bin/$ABI/$BINARY" "$STAGE_DIR/service/openlist/bin/"
            chmod 755 "$STAGE_DIR/service/openlist/bin/$BINARY"
        fi

        # Bake the per-channel, per-variant, per-ABI update source into
        # module.prop. Dev builds (no upstream-versions.env) leave updateJson
        # out on purpose.
        update_url=""
        case "$CHANNEL" in
            stable | prerelease) update_url="$RAW_BASE/update/$CHANNEL/$VARIANT/$ABI.json" ;;
        esac
        stamp_module_prop "$STAGE_DIR/module.prop" "$update_url" "$VARIANT_NAME" "$VARIANT_DESC"

        {
            echo "moduleVersion=$VERSION"
            echo "moduleVersionCode=$VERSION_CODE"
            echo "moduleChannel=$CHANNEL"
            echo "moduleVariant=$VARIANT"
            echo "targetAbi=$ABI"
            [ ! -f "$OUT_DIR/upstream-versions.env" ] || cat "$OUT_DIR/upstream-versions.env"
        } > "$STAGE_DIR/build-info.prop"

        ZIP_NAME="${NAME}-${VERSION}-${VARIANT}-${ABI}.zip"
        ZIP_PATH="$OUT_DIR/$ZIP_NAME"
        rm -f "$ZIP_PATH"
        (cd "$STAGE_DIR" && zip -qr "$ZIP_PATH" .)
        PACKAGES+=("$ZIP_NAME")

        rm -rf "$STAGE_DIR"
        trap - EXIT
        echo "=> out/$ZIP_NAME ($(du -h "$ZIP_PATH" | cut -f1))"
    done
done

(cd "$OUT_DIR" && sha256sum "${PACKAGES[@]}" > SHA256SUMS)
echo "=> out/SHA256SUMS"
