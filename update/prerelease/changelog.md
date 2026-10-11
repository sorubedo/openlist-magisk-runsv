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
1c2aa3cc78483990109bd66fff801c818a815f570a37714253965079c550a607  openlist-runsv-4.2.7-beta.20261010-nomount-arm64-v8a.zip
6b87807bf3a885408775df4df8b1fcea7724b96012c59be94e0872c29ad66ab1  openlist-runsv-4.2.7-beta.20261010-nomount-armeabi-v7a.zip
5a88a91565059963a3c81c20322c8b77f494280a9711dfeb9b2035810845bf78  openlist-runsv-4.2.7-beta.20261010-nomount-x86_64.zip
137bc4dc5e765ba840ff85cb392622c61472e9ed70be1ad568b3e4abaf5c6b41  openlist-runsv-4.2.7-beta.20261010-nomount-x86.zip
292a0aaef18f7b796bdff353a1588c3e892752c166f57d9480b4f824a2de4941  openlist-runsv-4.2.7-beta.20261010-mount-arm64-v8a.zip
b984b11184b66e2f2efc0c18a3846710f7159da6055eaa0df67e91c53a530e77  openlist-runsv-4.2.7-beta.20261010-mount-armeabi-v7a.zip
58158b24a4b755b9d8edb3505ec831a751c849950afd6e9a34ccbdaa73037925  openlist-runsv-4.2.7-beta.20261010-mount-x86_64.zip
8d5c34910b7ac7500a577a3c7b402cf920f4dfd320652edeb8669b4616710525  openlist-runsv-4.2.7-beta.20261010-mount-x86.zip
```
