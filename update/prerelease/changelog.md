## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | prerelease |
| Module version | 4.2.10-beta.20261107 |
| OpenList upstream | [beta](https://github.com/OpenListTeam/OpenList/releases/tag/beta) |
| Upstream build time | 2026-11-07T09:55:57Z |

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
8819b0cd7fbacdf01d515001d13d7b08b56141bc851f8c01afa145e7eaa8ba0b  openlist-runsv-4.2.10-beta.20261107-nomount-arm64-v8a.zip
2931356ec66c4883cb4bda97f3b75b98e309acde878fe26faa341ef5d7615a2a  openlist-runsv-4.2.10-beta.20261107-nomount-armeabi-v7a.zip
ad0982a21be3c5959f34d615d8f1478dc1adfa374789c3e52c68df59d7cba037  openlist-runsv-4.2.10-beta.20261107-nomount-x86_64.zip
5f49a724fe069c96c6967da33b9efa9e6a5f165f849aea654971fd7bbd6605d7  openlist-runsv-4.2.10-beta.20261107-nomount-x86.zip
31af5fc13d3c7dac5b6eb11056da571d09e7df35ca66dc9b1cc1a7b24ab8771d  openlist-runsv-4.2.10-beta.20261107-mount-arm64-v8a.zip
3b80fead98f54c8512388df29213f6bd3bc7d5e11d1525235b24eb3a3809571a  openlist-runsv-4.2.10-beta.20261107-mount-armeabi-v7a.zip
58b007b877ea8cbd988069dfa490bd283d29000fc08e1ee9f309589ef484c15b  openlist-runsv-4.2.10-beta.20261107-mount-x86_64.zip
29129e6d03f2ac17529290137659198299106fd44cf386dcb25101981d2b94be  openlist-runsv-4.2.10-beta.20261107-mount-x86.zip
```
