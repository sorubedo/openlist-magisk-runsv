## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | prerelease |
| Module version | 4.2.7-beta.20261010 |
| OpenList upstream | [beta](https://github.com/OpenListTeam/OpenList/releases/tag/beta) |
| Upstream build time | 2026-10-10T03:54:23Z |

The module version and versionCode are derived from the upstream OpenList release.
The pre-release is published under the upstream rolling `beta` tag, so the asset
URL stays the same while its contents move with `main`.

## Variants

| Variant | Core binary location | Runs as | Data folder | Update note |
| --- | --- | --- | --- | --- |
| nomount | service folder (`/data/adb/runsvdir/service/openlist/bin/openlist`) | root | `./data` | `sv restart` reloads the binary |
| mount | module `system/bin/openlist` mounted at `/system/bin/openlist` | shell + storage groups | `/storage/emulated/0/Android/openlist` | reboot to mount the new binary |

Use `mount` to run the core as a normal user; `/data/adb` is not readable
by normal users, only `/system/bin` is.

## ABI packages

| Asset suffix | Android / Magisk architecture |
| --- | --- |
| arm64-v8a | arm64 |
| armeabi-v7a | arm |
| x86_64 | x64 |
| x86 | x86 |

Each ZIP is one variant + one ABI only (assets are named `...-<variant>-<abi>.zip`). Download the asset matching the target device and the variant you want.

Requires [runsvdir-magisk](https://github.com/sorubedo/runsvdir-magisk) to be installed and rebooted first.

## SHA-256

```text
4b9d85b89224ee92e8d37ef6df03cf819615c256fbbf8addef0e6f5337e11953  openlist-runsv-4.2.7-beta.20261010-nomount-arm64-v8a.zip
d825aebc74ed6cea28b65fbd7dba3c617f6f2aa174ea80421a7759d0d468c33b  openlist-runsv-4.2.7-beta.20261010-nomount-armeabi-v7a.zip
03e8c6b2dc9a9bc5d5783d25b85f6791c9fcd77ae4b0b72980844d5b04f3d1ea  openlist-runsv-4.2.7-beta.20261010-nomount-x86_64.zip
9a332785452e4c15986b8b3b1c39c603adde9a699c2f5fcf6347cbb958e8a944  openlist-runsv-4.2.7-beta.20261010-nomount-x86.zip
d149fe541ebfff058fb6db28ba00f4793b24372d73d0d4ce406b172afe076a6a  openlist-runsv-4.2.7-beta.20261010-mount-arm64-v8a.zip
6069b69c03d46e9b4cb7f95af62e56754578109a8fca0fdd5091506ae674d385  openlist-runsv-4.2.7-beta.20261010-mount-armeabi-v7a.zip
3c00d448960cfbaf514a70757f271d2d909ebd5615fc416d6b7d365143c786a5  openlist-runsv-4.2.7-beta.20261010-mount-x86_64.zip
7d3c4e6e7a5199c75bf28eae4d18feb6757ddb28eec62f5636026027f7e6ac0f  openlist-runsv-4.2.7-beta.20261010-mount-x86.zip
```
