#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BIN_DIR="$SCRIPT_DIR/bin"
OUT_DIR="$SCRIPT_DIR/out"
OL_REPO="OpenListTeam/OpenList"
BIN=openlist
CHANNEL="${1:-auto}"
OL_TMP="$(mktemp -d)"
trap 'rm -rf "$OL_TMP"' EXIT

# OpenList platform names in releases
declare -A OL_PLAT=(
    ["arm64-v8a"]="android-arm64"
    ["armeabi-v7a"]="android-arm"
    ["x86_64"]="android-amd64"
    ["x86"]="android-386"
)

usage() {
    cat <<EOF
Usage: $0 [stable|prerelease|auto|TAG]

  stable       latest stable OpenList release
  prerelease   latest OpenList pre-release (the rolling "beta" tag)
  auto         latest pre-release, falling back to stable (default)
  TAG          pin an explicit tag, e.g. v4.2.6

Downloads the Android binaries into bin/<abi>/ and writes
out/upstream-versions.env with the module version mapping.
EOF
}

api() {
    # --retry-all-errors + --http1.1: the releases list is a large document and
    # HTTP/2 streams occasionally get cancelled mid-transfer on CI runners.
    curl -fsSL --http1.1 --retry 3 --retry-delay 2 --retry-all-errors \
        -H "Accept: application/vnd.github+json" \
        "https://api.github.com/repos/$OL_REPO/$1"
}

latest_prerelease() {
    # OpenList publishes its rolling pre-release under the fixed "beta" tag.
    api "releases/tags/beta" | jq -r '.tag_name // empty'
}

latest_stable() {
    api "releases/latest" | jq -r '.tag_name // empty'
}

case "$CHANNEL" in
    -h | --help)
        usage
        exit 0
        ;;
    stable)
        OL_TAG="$(latest_stable)"
        ;;
    prerelease)
        OL_TAG="$(latest_prerelease)"
        ;;
    auto)
        OL_TAG="$(latest_prerelease)"
        [ -n "$OL_TAG" ] || OL_TAG="$(latest_stable)"
        ;;
    v*)
        OL_TAG="$CHANNEL"
        ;;
    [0-9]*)
        OL_TAG="v$CHANNEL"
        ;;
    *)
        echo "Unknown channel or tag: $CHANNEL" >&2
        usage >&2
        exit 1
        ;;
esac

[ -n "$OL_TAG" ] || {
    echo "ERROR: could not resolve an OpenList tag for channel '$CHANNEL'" >&2
    exit 1
}

echo "=> OpenList: $OL_TAG"

for ABI in "${!OL_PLAT[@]}"; do
    PLAT="${OL_PLAT[$ABI]}"
    ASSET="openlist-${PLAT}.tar.gz"
    URL="https://github.com/$OL_REPO/releases/download/${OL_TAG}/${ASSET}"

    echo "   Downloading $ASSET..."
    if ! curl -fsSL "$URL" -o "$OL_TMP/$ASSET"; then
        echo "   skip $ABI: $ASSET not available"
        continue
    fi

    mkdir -p "$BIN_DIR/$ABI" "$OL_TMP/$ABI"
    tar xzf "$OL_TMP/$ASSET" -C "$OL_TMP/$ABI"
    find "$OL_TMP/$ABI" -name "$BIN" -type f -exec cp {} "$BIN_DIR/$ABI/$BIN" \;
    chmod 755 "$BIN_DIR/$ABI/$BIN"
    echo "   ok: bin/$ABI/$BIN ($(du -h "$BIN_DIR/$ABI/$BIN" | cut -f1))"
done

# --- map the upstream release to module version / versionCode ---------
#
# OpenList tags its stable releases (v4.2.6) but publishes the rolling
# pre-release under the fixed "beta" tag, whose binaries report the Go
# pseudo-version of main (e.g. v4.2.7-0.20261003074529-4c39bbe9c228). The Go
# build info embedded in every binary carries both that version and the UTC
# build time, so the module can follow upstream even for a moving tag.
#
# versionCode layout (stays well below Magisk's 32-bit Int limit):
#
#   YY * 10000000 + MM * 100000 + DD * 1000 + HH
#
# i.e. the UTC build time of the upstream binary with hour granularity. It is
# monotonic for stable and pre-release builds alike, so a build always sorts
# above anything built before it, whichever channel it came from.
#
REF=""
for ABI in "${!OL_PLAT[@]}"; do
    if [ -f "$BIN_DIR/$ABI/$BIN" ]; then
        REF="$BIN_DIR/$ABI/$BIN"
        break
    fi
done
[ -n "$REF" ] || {
    echo "ERROR: no OpenList binary was downloaded for $OL_TAG" >&2
    exit 1
}

# Exact upstream version: "4.2.6" or "4.2.7-0.20261003074529-4c39bbe9c228".
BIN_VERSION="$(grep -aoE 'OpenList/v4.v4\.[0-9][0-9A-Za-z.+~-]*' "$REF" \
    | head -n 1 | sed -E 's|^OpenList/v4.?v||; s|\+dirty$||')"
# UTC build time, e.g. 2026-10-03T07:45:29Z.
BIN_TIME="$(grep -aoE 'vcs\.time=[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}Z' "$REF" \
    | head -n 1 | cut -d= -f2)"

if [ -z "$BIN_VERSION" ] || [ -z "$BIN_TIME" ]; then
    echo "ERROR: could not read version / build time from $REF" >&2
    exit 1
fi

if [[ "$OL_TAG" =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    MODULE_CHANNEL=stable
    VERSION="${OL_TAG#v}"
else
    MODULE_CHANNEL=prerelease
    CORE="${BIN_VERSION%%-*}"
    STAMP="${BIN_VERSION#*-}"
    if [ "$STAMP" != "$BIN_VERSION" ]; then
        # A pseudo-version: v4.2.7-0.20261003074529-<commit>
        STAMP="${STAMP#0.}"
        PREDATE="${STAMP%%-*}"
        VERSION="${CORE}-beta.${PREDATE:0:8}"
    else
        VERSION="$BIN_VERSION"
    fi
fi

BUILD_DATE="${BIN_TIME%%T*}"        # 2026-10-03
BUILD_HOUR="${BIN_TIME#*T}"         # 07:45:29Z
YY="${BUILD_DATE:2:2}"
MM="${BUILD_DATE:5:2}"
DD="${BUILD_DATE:8:2}"
HH="${BUILD_HOUR:0:2}"

VERSION_CODE=$((10#$YY * 10000000 + 10#$MM * 100000 + 10#$DD * 1000 + 10#$HH))

mkdir -p "$OUT_DIR"
cat > "$OUT_DIR/upstream-versions.env" <<EOF
OPENLIST_TAG=$OL_TAG
OPENLIST_VERSION=$VERSION
OPENLIST_VERSION_CODE=$VERSION_CODE
OPENLIST_BUILT_AT=$BIN_TIME
MODULE_CHANNEL=$MODULE_CHANNEL
EOF

echo ""
echo "=> Module version: $VERSION (versionCode $VERSION_CODE, $MODULE_CHANNEL)"
echo "=> Wrote out/upstream-versions.env"

if [ -n "${GITHUB_OUTPUT:-}" ]; then
    {
        echo "openlist_tag=$OL_TAG"
        echo "openlist_version=$VERSION"
        echo "openlist_version_code=$VERSION_CODE"
        echo "module_channel=$MODULE_CHANNEL"
    } >> "$GITHUB_OUTPUT"
fi
