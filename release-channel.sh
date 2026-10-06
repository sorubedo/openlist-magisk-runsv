#!/bin/bash
#
# Build and publish one release channel (stable | prerelease):
#   fetch OpenList binaries -> package every ABI -> create/update the GitHub
#   release (nomount + mount) -> regenerate update/<channel>/<variant>/<abi>.json.
#
# Meant to run inside the "Build and Release" workflow, but a local dry run is
# possible with DRY_RUN=true (skips the GitHub release calls).
#
# The pre-release channel publishes under the upstream "beta" tag, which is a
# moving tag: every run replaces the assets of the same release, exactly like
# upstream does. The stable channel uses the immutable vX.Y.Z tag.
#
# Environment:
#   REPO_SLUG  this repo (default: sorubedo/openlist-magisk-runsv)
#   GH_TOKEN   token used by `gh release ...` (required unless DRY_RUN=true)
#   DRY_RUN    true to skip creating/updating the GitHub release
#

set -euo pipefail

CHANNEL="${1:?usage: release-channel.sh <stable|prerelease>}"
PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"
OUT_DIR="$PROJECT_DIR/out"
REPO_SLUG="${REPO_SLUG:-sorubedo/openlist-magisk-runsv}"
DRY_RUN="${DRY_RUN:-false}"

case "$CHANNEL" in
    stable | prerelease) ;;
    *)
        echo "ERROR: unknown channel '$CHANNEL'" >&2
        exit 1
        ;;
esac

cd "$PROJECT_DIR"

echo "==> [$CHANNEL] fetch OpenList binaries"
bash fetch.sh "$CHANNEL"

set -a
# shellcheck disable=SC1091
. "$OUT_DIR/upstream-versions.env"
set +a

TAG="$OPENLIST_TAG"
VERSION="$OPENLIST_VERSION"
NOTES="$OUT_DIR/release-notes.md"

echo "==> [$CHANNEL] package $VERSION"
# Drop anything a previous channel in the same job left in out/, so a stale
# package can never end up in this channel's release.
rm -f "$OUT_DIR"/*.zip "$OUT_DIR"/SHA256SUMS
bash package.sh

# Explicit asset list for this channel (never a wildcard).
ASSETS=()
for variant in nomount mount; do
    for abi in arm64-v8a armeabi-v7a x86_64 x86; do
        ASSETS+=("$OUT_DIR/openlist-runsv-$VERSION-$variant-$abi.zip")
    done
done
ASSETS+=("$OUT_DIR/SHA256SUMS" "$OUT_DIR/upstream-versions.env")

for asset in "${ASSETS[@]}"; do
    if [ ! -f "$asset" ]; then
        echo "ERROR: expected release asset is missing: $asset" >&2
        exit 1
    fi
done

# --- release notes ----------------------------------------------------
{
    echo "## Build information"
    echo
    echo "| Component | Value |"
    echo "| --- | --- |"
    echo "| Module | openlist-runsv |"
    echo "| Channel | $MODULE_CHANNEL |"
    echo "| Module version | $VERSION |"
    echo "| OpenList upstream | [$TAG](https://github.com/OpenListTeam/OpenList/releases/tag/$TAG) |"
    echo "| Upstream build time | $OPENLIST_BUILT_AT |"
    echo
    echo "The module version and versionCode are derived from the upstream OpenList release."
    if [ "$CHANNEL" = "prerelease" ]; then
        echo "The pre-release is published under the upstream rolling \`beta\` tag, so the asset"
        echo "URL stays the same while its contents move with \`main\`."
    fi
    echo
    echo "## Variants"
    echo
    echo "| Variant | Core binary location | Runs as | Data folder | Update note |"
    echo "| --- | --- | --- | --- | --- |"
    echo "| nomount | service folder (\`/data/adb/runsvdir/service/openlist/bin/openlist\`) | root | \`./data\` | \`sv restart\` reloads the binary |"
    echo "| mount | module \`system/bin/openlist\` mounted at \`/system/bin/openlist\` | shell + storage groups | \`/storage/emulated/0/Android/openlist\` | reboot to mount the new binary |"
    echo
    echo "Use \`mount\` to run the core as a normal user; \`/data/adb\` is not readable"
    echo "by normal users, only \`/system/bin\` is."
    echo
    echo "## ABI packages"
    echo
    echo "| Asset suffix | Android / Magisk architecture |"
    echo "| --- | --- |"
    echo "| arm64-v8a | arm64 |"
    echo "| armeabi-v7a | arm |"
    echo "| x86_64 | x64 |"
    echo "| x86 | x86 |"
    echo
    echo "Each ZIP is one variant + one ABI only (assets are named \`...-<variant>-<abi>.zip\`). Download the asset matching the target device and the variant you want."
    echo
    echo "Requires [runsvdir-magisk](https://github.com/sorubedo/runsvdir-magisk) to be installed and rebooted first."
    echo
    echo "## SHA-256"
    echo
    echo '```text'
    cat "$OUT_DIR/SHA256SUMS"
    echo '```'
} > "$NOTES"

[ -n "${GITHUB_STEP_SUMMARY:-}" ] && cat "$NOTES" >> "$GITHUB_STEP_SUMMARY"

# --- GitHub release ---------------------------------------------------
PRERELEASE_FLAG=""
[ "$CHANNEL" = "prerelease" ] && PRERELEASE_FLAG="--prerelease"

if [ "$DRY_RUN" = "true" ]; then
    echo "==> [$CHANNEL] DRY_RUN: would release $TAG"
else
    if gh release view "$TAG" >/dev/null 2>&1; then
        echo "==> [$CHANNEL] update existing release $TAG"
        gh release upload "$TAG" "${ASSETS[@]}" --clobber
        # shellcheck disable=SC2086
        gh release edit "$TAG" --title "$TAG (runsv module)" --notes-file "$NOTES" $PRERELEASE_FLAG
    else
        echo "==> [$CHANNEL] create release $TAG"
        # shellcheck disable=SC2086
        gh release create "$TAG" \
            --title "$TAG (runsv module)" \
            --notes-file "$NOTES" \
            $PRERELEASE_FLAG \
            "${ASSETS[@]}"
    fi
fi

echo "==> [$CHANNEL] publish update metadata"
bash publish-update.sh

echo "==> [$CHANNEL] done: $TAG"
