## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | prerelease |
| Module version | 4.2.11-beta.20261128 |
| OpenList upstream | [beta](https://github.com/OpenListTeam/OpenList/releases/tag/beta) |
| Upstream build time | 2026-11-28T04:27:21Z |

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
07ffad10c576b117038b87d84cb9b6c05a675ef913929f81c75ec19ea10252a7  openlist-runsv-4.2.11-beta.20261128-nomount-arm64-v8a.zip
a9df09723e2734b31636247941720cb81f4fcdebe4dec6f5afe9f5b1e1ff6a92  openlist-runsv-4.2.11-beta.20261128-nomount-armeabi-v7a.zip
148deafea57cb82a49ebba995c3e8c15ab4dbe24ec577d40a8c51a5637731e5b  openlist-runsv-4.2.11-beta.20261128-nomount-x86_64.zip
8127e5473b8991526304f920f6f9836f9f86987643815b7bada704d94523ff56  openlist-runsv-4.2.11-beta.20261128-nomount-x86.zip
9defdbf786a6b0dff1ce04a2c63eb93cec3e0c7431ef4d1ad6e3aed120d0b832  openlist-runsv-4.2.11-beta.20261128-mount-arm64-v8a.zip
cd9b0062a8e997912a9bdcb2bb2d033586b3d032e3d31dcb0ee5a1277cd8d07e  openlist-runsv-4.2.11-beta.20261128-mount-armeabi-v7a.zip
12b6e6abfac90f3bf797f83266bba789de114b7ef8a54d8e0d2e2ba9c3356bbd  openlist-runsv-4.2.11-beta.20261128-mount-x86_64.zip
0d1617ab578d744fe9d6b3b55a363f9d4811334f702e187089a6c32ddeb34d45  openlist-runsv-4.2.11-beta.20261128-mount-x86.zip
```
