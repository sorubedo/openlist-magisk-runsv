#!/bin/bash
#
# Generate the per-channel / per-variant / per-ABI update metadata that the
# Magisk, KernelSU and APatch module update checkers fetch.
#
# The files live in update/<channel>/<variant>/<abi>.json (variant: nomount |
# mount) and are committed to the repo, then served over raw.githubusercontent
# .com. Run fetch.sh first so that out/upstream-versions.env exists.
#
# Usage:
#   ./publish-update.sh [upstream-versions.env]
#
# Environment overrides:
#   REPO_SLUG      owner/repo                  (default: sorubedo/openlist-magisk-runsv)
#   RAW_BASE       raw base URL of this repo   (default: https://raw.githubusercontent.com/<owner>/<repo>/main)
#   CHANGELOG_SRC  markdown file to publish    (default: out/release-notes.md)
#

set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"
OUT_DIR="$PROJECT_DIR/out"
UPDATE_DIR="$PROJECT_DIR/update"
ABIS=(arm64-v8a armeabi-v7a x86_64 x86)
VARIANTS=(nomount mount)

REPO_SLUG="${REPO_SLUG:-sorubedo/openlist-magisk-runsv}"
RAW_BASE="${RAW_BASE:-https://raw.githubusercontent.com/$REPO_SLUG/main}"
CHANGELOG_SRC="${CHANGELOG_SRC:-$OUT_DIR/release-notes.md}"
ENV_FILE="${1:-$OUT_DIR/upstream-versions.env}"

if [ ! -f "$ENV_FILE" ]; then
    echo "ERROR: $ENV_FILE not found; run fetch.sh first" >&2
    exit 1
fi

# shellcheck disable=SC1090
. "$ENV_FILE"

VERSION="${OPENLIST_VERSION:?missing OPENLIST_VERSION in $ENV_FILE}"
VERSION_CODE="${OPENLIST_VERSION_CODE:?missing OPENLIST_VERSION_CODE in $ENV_FILE}"
TAG="${OPENLIST_TAG:?missing OPENLIST_TAG in $ENV_FILE}"
CHANNEL="${MODULE_CHANNEL:?missing MODULE_CHANNEL in $ENV_FILE}"

case "$CHANNEL" in
    stable | prerelease) ;;
    *)
        echo "ERROR: unsupported channel '$CHANNEL' (expected stable or prerelease)" >&2
        exit 1
        ;;
esac

CHAN_DIR="$UPDATE_DIR/$CHANNEL"
mkdir -p "$CHAN_DIR"

# --- changelog --------------------------------------------------------
# Shared by both variants of this channel.
if [ -f "$CHANGELOG_SRC" ]; then
    cp "$CHANGELOG_SRC" "$CHAN_DIR/changelog.md"
else
    {
        echo "# openlist-runsv $VERSION"
        echo
        echo "Release: https://github.com/$REPO_SLUG/releases/tag/$TAG"
    } > "$CHAN_DIR/changelog.md"
fi
CHANGELOG_URL="$RAW_BASE/update/$CHANNEL/changelog.md"

echo "=> channel: $CHANNEL (module version $VERSION, versionCode $VERSION_CODE)"

# --- one update.json per variant / ABI --------------------------------
for VARIANT in "${VARIANTS[@]}"; do
    mkdir -p "$CHAN_DIR/$VARIANT"
    for ABI in "${ABIS[@]}"; do
        ZIP_NAME="openlist-runsv-${VERSION}-${VARIANT}-${ABI}.zip"
        cat > "$CHAN_DIR/$VARIANT/$ABI.json" <<EOF
{
  "version": "$VERSION",
  "versionCode": $VERSION_CODE,
  "zipUrl": "https://github.com/$REPO_SLUG/releases/download/$TAG/$ZIP_NAME",
  "changelog": "$CHANGELOG_URL"
}
EOF
        echo "   update/$CHANNEL/$VARIANT/$ABI.json"
    done
done

echo "   update/$CHANNEL/changelog.md"
