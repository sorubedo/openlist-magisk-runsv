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
511c41ad176ba89eaeacca78661de36347f927b195337ac5f07f10423069d4a4  openlist-runsv-4.2.7-beta.20261010-nomount-arm64-v8a.zip
d2851bdc57d3c4e481fad3c4237ec09e586abfc76a394a3cf6583b6dfad723d8  openlist-runsv-4.2.7-beta.20261010-nomount-armeabi-v7a.zip
39a88dba6cd58be98a19fe6d57fd62776f684e3cbc7ceed7dbd9a95f24b119fc  openlist-runsv-4.2.7-beta.20261010-nomount-x86_64.zip
bbc035477b8abc5f288d456c4dba25c6812b845e334e9c2f47cc36b7c4757cfe  openlist-runsv-4.2.7-beta.20261010-nomount-x86.zip
b85c75cbe08b995ad5a2f24b5339212f2bc8e713158459d29b952a255e1b54bb  openlist-runsv-4.2.7-beta.20261010-mount-arm64-v8a.zip
83dd9ca68715571bb3bba9a250b7d46af55ff867e4716cfa7784996435399bba  openlist-runsv-4.2.7-beta.20261010-mount-armeabi-v7a.zip
5aed99232a044875b7addc91a0d9698006211073f4d496cb89c47e50f539832a  openlist-runsv-4.2.7-beta.20261010-mount-x86_64.zip
1b038073ce387900605e22ced018439f1a1b3e191d07597449eb5b8c2c3e2ea1  openlist-runsv-4.2.7-beta.20261010-mount-x86.zip
```
