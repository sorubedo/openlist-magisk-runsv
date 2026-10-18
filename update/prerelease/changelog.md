## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | prerelease |
| Module version | 4.2.7-beta.20261015 |
| OpenList upstream | [beta](https://github.com/OpenListTeam/OpenList/releases/tag/beta) |
| Upstream build time | 2026-10-15T14:18:40Z |

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
dc832b3ccbada1c30f538c10a5e1c695d54e17abc5b2d36da859d6edc224d20f  openlist-runsv-4.2.7-beta.20261015-nomount-arm64-v8a.zip
292c2afd81b7c89cf77a8f5a78e70c8962b817596eee24796448925fb351c871  openlist-runsv-4.2.7-beta.20261015-nomount-armeabi-v7a.zip
3fa48b77a21edc678bd398b488cc15a0578abf864a9786a7f89523bafa16b0b2  openlist-runsv-4.2.7-beta.20261015-nomount-x86_64.zip
470a4fc8b0ca577ac66f9f302492c7151dc53645c046eefb4a97e75c34272f0f  openlist-runsv-4.2.7-beta.20261015-nomount-x86.zip
4f38d678b1f43c6583dc77a488cfac7096747f2beaa0678e46a657c404b70f77  openlist-runsv-4.2.7-beta.20261015-mount-arm64-v8a.zip
611ff7fdf197f9166fb70b185b3a86f2218251afb76215d26dc55c169c68bb7d  openlist-runsv-4.2.7-beta.20261015-mount-armeabi-v7a.zip
d4a8c5ef57fa1917ec2fb0a728f8a99b34577cceb81297645c5accf78aa8b69e  openlist-runsv-4.2.7-beta.20261015-mount-x86_64.zip
2818a6b33f99385292cf7463e69884fc094757fa6bfb8023f79eb220538eb333  openlist-runsv-4.2.7-beta.20261015-mount-x86.zip
```
