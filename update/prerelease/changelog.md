## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | prerelease |
| Module version | 4.2.10-beta.20261113 |
| OpenList upstream | [beta](https://github.com/OpenListTeam/OpenList/releases/tag/beta) |
| Upstream build time | 2026-11-13T03:52:16Z |

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
86905e2e38a2007e3925c0a5e9ab9c38089c5834abd48786563fc33ccd80923d  openlist-runsv-4.2.10-beta.20261113-nomount-arm64-v8a.zip
36c921adf1597f2230f45acd6835effad1d500d611f716e5190fd20e07e06e44  openlist-runsv-4.2.10-beta.20261113-nomount-armeabi-v7a.zip
d6d509f3b218343b66ebdb5c1f8861a1f40d42ef1f50c1ee812dc6493c403a99  openlist-runsv-4.2.10-beta.20261113-nomount-x86_64.zip
94c138741c5d0d45923ee9d10ca50f3e3fc0176a69b2c205825a814e4491e857  openlist-runsv-4.2.10-beta.20261113-nomount-x86.zip
8e19ed9cf4f8679f6b668ab0ea2371585edcac61b195ee3c6eb4eb9b365425cb  openlist-runsv-4.2.10-beta.20261113-mount-arm64-v8a.zip
2ac92b1640314b0e237f153a25781591a7d5791d57ffcbf9eff432019a7d38b4  openlist-runsv-4.2.10-beta.20261113-mount-armeabi-v7a.zip
630bfac0abb128be07d3b3a44edbf54060981b49ac4d38d1a4e4689ec00b28fc  openlist-runsv-4.2.10-beta.20261113-mount-x86_64.zip
77be3ec893f52088f8736b78e4d79e1cb64cd4b45c5d4f2277c5a9b73170fbe0  openlist-runsv-4.2.10-beta.20261113-mount-x86.zip
```
