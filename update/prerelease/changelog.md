## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | prerelease |
| Module version | 4.2.8-beta.20261022 |
| OpenList upstream | [beta](https://github.com/OpenListTeam/OpenList/releases/tag/beta) |
| Upstream build time | 2026-10-22T13:15:20Z |

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
8a2c4bbf8773bd2e70d968834a22b754421ff715aa0f6ce8ab69a867b414c550  openlist-runsv-4.2.8-beta.20261022-nomount-arm64-v8a.zip
4c5203b5c2a8763c6c5c8ac01b3a22d59bc041c7fab0f6fadd3b50f4f6b4ec56  openlist-runsv-4.2.8-beta.20261022-nomount-armeabi-v7a.zip
8b604f0236f177993f2887663626b296864e58a71e88e24e0cb845fa8e184ce4  openlist-runsv-4.2.8-beta.20261022-nomount-x86_64.zip
8d054c616fe9e3f33d49164ef42f206ec93d007e8a0fc088317ec7f2754ec187  openlist-runsv-4.2.8-beta.20261022-nomount-x86.zip
def039248c304685a19cde8f5bbf52cb0c06f7b79de74a1cc414f28b5b638434  openlist-runsv-4.2.8-beta.20261022-mount-arm64-v8a.zip
56d8c3f7dd6c1cb0e95ad9ccc036d089ee7c589917054140f9db75fdc65c786e  openlist-runsv-4.2.8-beta.20261022-mount-armeabi-v7a.zip
6620b93fd46df444eb1d8651bfb4574a77fa2f41c5a1a466f88b80d5a93197c6  openlist-runsv-4.2.8-beta.20261022-mount-x86_64.zip
e55e9217c845f79250540cbf9371dc18427634d56394d5aa28a1b0323c6fc0cf  openlist-runsv-4.2.8-beta.20261022-mount-x86.zip
```
