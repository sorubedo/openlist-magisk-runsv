## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | prerelease |
| Module version | 4.2.10-beta.20261030 |
| OpenList upstream | [beta](https://github.com/OpenListTeam/OpenList/releases/tag/beta) |
| Upstream build time | 2026-10-30T04:33:49Z |

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
af40dba6ce3149c38908897d4040df8f4d32091fa3d4f6d7a77f7904c0e10b54  openlist-runsv-4.2.10-beta.20261030-nomount-arm64-v8a.zip
1265a496f13c91d0f8e89d9db7eb7eb52bab8d76fa8705dada0cd11fdc198b85  openlist-runsv-4.2.10-beta.20261030-nomount-armeabi-v7a.zip
04e858f63b782dacc7052b5fd0b610797af2ddbe49e5fbab63abc03720ceec28  openlist-runsv-4.2.10-beta.20261030-nomount-x86_64.zip
09068d1eac627558ce77983dd06dba56b220040231b45898dcdca5f320bba524  openlist-runsv-4.2.10-beta.20261030-nomount-x86.zip
1b51459ae62e1a337c858e86ba21f15698ba7fa09eef6b1356416c95f51d755a  openlist-runsv-4.2.10-beta.20261030-mount-arm64-v8a.zip
b7cb0fe29aed9baca9f2df7ba83197e0e002edf5b555deffedc1bab194f760be  openlist-runsv-4.2.10-beta.20261030-mount-armeabi-v7a.zip
fbcd6078264f81645fa69080ceb585312e26cf3a3be829de08433e2d7ab4a001  openlist-runsv-4.2.10-beta.20261030-mount-x86_64.zip
14c30167ab84fae103adf5cc7f526713d4ab26c9d5992c53c29026cbb70f7886  openlist-runsv-4.2.10-beta.20261030-mount-x86.zip
```
