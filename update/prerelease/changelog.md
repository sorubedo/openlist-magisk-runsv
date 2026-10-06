## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | prerelease |
| Module version | 4.2.7-beta.20261003 |
| OpenList upstream | [beta](https://github.com/OpenListTeam/OpenList/releases/tag/beta) |
| Upstream build time | 2026-10-03T07:45:29Z |

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
9a2a9a675c0ac6bd060820cda5d408ff30b8c8ad9f3945de33b65f8443e0acc9  openlist-runsv-4.2.7-beta.20261003-nomount-arm64-v8a.zip
971422e8470174b3f71a6932a5c33fb2d4b28304b6e986c81f48caa27455f5bf  openlist-runsv-4.2.7-beta.20261003-nomount-armeabi-v7a.zip
9fa2d610fbd27e5d29d2de3ca3cf5575b7ac7f2340803a5a865c2c3727d27e7a  openlist-runsv-4.2.7-beta.20261003-nomount-x86_64.zip
1dfd16693776f1ec1c27c99d79d4560e15c682bb11b727df8e743f616ddf9da8  openlist-runsv-4.2.7-beta.20261003-nomount-x86.zip
58eccb147102d9ff4f408df30f17f581f51e506466d813057101620d2ca82038  openlist-runsv-4.2.7-beta.20261003-mount-arm64-v8a.zip
878b19d5845c49772afd56fa29c3bb876390dc5bcb038ee978f885a187a1d7b5  openlist-runsv-4.2.7-beta.20261003-mount-armeabi-v7a.zip
0e32c0df3131149fdba0ade428d1b3e86f7dc97c2c2c78b551ca2bf6906af786  openlist-runsv-4.2.7-beta.20261003-mount-x86_64.zip
efd71b903379d2a2a45ecea816856cedb9c5540af4e8cbed9aeec518a2c5a62f  openlist-runsv-4.2.7-beta.20261003-mount-x86.zip
```
