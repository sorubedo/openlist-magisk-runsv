#!/bin/bash
#
# Decide which module channel(s) need a new release.
#
# A channel is selected when
#   * the channel's upstream release is newer than the matching release in this
#     repo (or this repo has no release for that upstream tag yet), or
#   * this repo's release exists but is missing the nomount/mount asset pairs.
#
# Comparing the asset upload times is what makes the moving upstream "beta" tag
# work: the pre-release tag name never changes, but its assets are replaced on
# every push to main.
#
# Prints the selected channel names (space separated) and writes them to
# $GITHUB_OUTPUT as "channels=<...>".
#
# Environment:
#   CHANNEL_INPUT  auto | stable | prerelease   (default: auto)
#   FORCE          true to select even if the release is already current
#   REPO_SLUG      this repo                    (default: sorubedo/openlist-magisk-runsv)
#   OL_REPO        upstream repo                (default: OpenListTeam/OpenList)
#   GH_TOKEN       token for the GitHub API     (optional; raises rate limit)
#

set -euo pipefail

REPO_SLUG="${REPO_SLUG:-sorubedo/openlist-magisk-runsv}"
OL_REPO="${OL_REPO:-OpenListTeam/OpenList}"
CHANNEL_INPUT="${CHANNEL_INPUT:-auto}"
FORCE="${FORCE:-false}"

# The upstream asset whose upload time tracks the release content.
UPSTREAM_MARKER_ASSET="openlist-android-arm64.tar.gz"
# Our asset whose upload time tracks our published package for that tag.
OURS_MARKER_PATTERN="-nomount-arm64-v8a\\.zip$"

api() {
    url="$1"
    # --retry-all-errors + --http1.1: the releases list is a large document and
    # HTTP/2 streams occasionally get cancelled mid-transfer on CI runners.
    set -- -fsSL --http1.1 --retry 3 --retry-delay 2 --retry-all-errors \
        -H "Accept: application/vnd.github+json"
    if [ -n "${GH_TOKEN:-}" ]; then
        curl "$@" -H "Authorization: Bearer $GH_TOKEN" "$url"
    else
        curl "$@" "$url"
    fi
}

latest_stable_tag() {
    api "https://api.github.com/repos/$OL_REPO/releases/latest" | jq -r '.tag_name // empty'
}

latest_prerelease_tag() {
    # OpenList publishes its rolling pre-release under the fixed "beta" tag.
    api "https://api.github.com/repos/$OL_REPO/releases/tags/beta" | jq -r '.tag_name // empty'
}

upstream_asset_time() {
    api "https://api.github.com/repos/$OL_REPO/releases/tags/$1" 2>/dev/null \
        | jq -r --arg name "$UPSTREAM_MARKER_ASSET" \
            '[.assets[] | select(.name == $name) | .updated_at] | .[0] // empty' 2>/dev/null
}

release_exists() {
    api "https://api.github.com/repos/$REPO_SLUG/releases/tags/$1" >/dev/null 2>&1
}

# True only when the release exists AND carries both the nomount and mount
# ZIPs. A release missing either variant is treated as "needs republishing".
release_has_variant_assets() {
    api "https://api.github.com/repos/$REPO_SLUG/releases/tags/$1" 2>/dev/null \
        | jq -e '([.assets[].name | select(test("-nomount-.+\\.zip$"))] | length > 0)
                 and ([.assets[].name | select(test("-mount-.+\\.zip$"))] | length > 0)' \
        >/dev/null 2>&1
}

our_asset_time() {
    api "https://api.github.com/repos/$REPO_SLUG/releases/tags/$1" 2>/dev/null \
        | jq -r --arg re "$OURS_MARKER_PATTERN" \
            '[.assets[] | select(.name | test($re)) | .updated_at] | .[0] // empty' 2>/dev/null
}

case "$CHANNEL_INPUT" in
    auto) CHANNELS="stable prerelease" ;;
    stable | prerelease) CHANNELS="$CHANNEL_INPUT" ;;
    *)
        echo "ERROR: unknown channel '$CHANNEL_INPUT' (auto|stable|prerelease)" >&2
        exit 1
        ;;
esac

SELECTED=""
for ch in $CHANNELS; do
    case "$ch" in
        stable) tag="$(latest_stable_tag)" ;;
        prerelease) tag="$(latest_prerelease_tag)" ;;
    esac

    if [ -z "$tag" ]; then
        echo "skip $ch: no upstream tag found" >&2
        continue
    fi

    if [ "$FORCE" != "true" ]; then
        if release_exists "$tag" && ! release_has_variant_assets "$tag"; then
            echo "republish $ch: $tag is missing nomount/mount assets" >&2
        elif release_exists "$tag"; then
            up_ts="$(upstream_asset_time "$tag")"
            our_ts="$(our_asset_time "$tag")"
            if [ -n "$our_ts" ] && [ -n "$up_ts" ] && [ ! "$up_ts" \> "$our_ts" ]; then
                echo "skip $ch: $tag is already published and current" >&2
                continue
            fi
            echo "republish $ch: $tag changed upstream (ours=${our_ts:-none}, upstream=${up_ts:-none})" >&2
        fi
    fi

    echo "select $ch: $tag" >&2
    SELECTED="${SELECTED:+$SELECTED }$ch"
done

echo "$SELECTED"
if [ -n "${GITHUB_OUTPUT:-}" ]; then
    echo "channels=$SELECTED" >> "$GITHUB_OUTPUT"
fi
