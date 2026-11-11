## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | prerelease |
| Module version | 4.2.10-beta.20261108 |
| OpenList upstream | [beta](https://github.com/OpenListTeam/OpenList/releases/tag/beta) |
| Upstream build time | 2026-11-08T05:22:06Z |

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
e419afd720139f8bf0348ad3197f01390520de21fc07ec03c99326130e017e6a  openlist-runsv-4.2.10-beta.20261108-nomount-arm64-v8a.zip
01408c2f3492071b5080812b4e7936faf3d66861342203e0baf841be3d0252ba  openlist-runsv-4.2.10-beta.20261108-nomount-armeabi-v7a.zip
20ede9b100a7915a7e17cfe5baab4ae3b20ad369b597325cfa30a633a1f50dd7  openlist-runsv-4.2.10-beta.20261108-nomount-x86_64.zip
0ce21c87d5d7aae1ad4bef9901948d6dd1686d2dadae9d69be238acf04b4afd8  openlist-runsv-4.2.10-beta.20261108-nomount-x86.zip
74573339c5189aa3797a1250af0334763a2941c2ccac0fee149aeb2fe37e3d94  openlist-runsv-4.2.10-beta.20261108-mount-arm64-v8a.zip
85a7ff5887320e9f6bb4366b4beda78252375fb7e90a6310e8d49dad0d8b3570  openlist-runsv-4.2.10-beta.20261108-mount-armeabi-v7a.zip
0b6d54ce2679ed556d16b8a9ef66d1842c23534d5a0d90576cfc89c7450e36aa  openlist-runsv-4.2.10-beta.20261108-mount-x86_64.zip
9b2fd74f043bf41409c8a45189ae9fdf5f4563629c84a7e4cecfbd65f598c62d  openlist-runsv-4.2.10-beta.20261108-mount-x86.zip
```
