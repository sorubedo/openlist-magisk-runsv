## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | prerelease |
| Module version | 4.2.10-beta.20261106 |
| OpenList upstream | [beta](https://github.com/OpenListTeam/OpenList/releases/tag/beta) |
| Upstream build time | 2026-11-06T04:48:12Z |

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
f250f339fb4bfd3c5298537564439aa9e350329f5c11d40b2169510f029caf35  openlist-runsv-4.2.10-beta.20261106-nomount-arm64-v8a.zip
f1645078d777da5d11e47f27687d5be1c9ffaa4e211a6235c6a7579601bac538  openlist-runsv-4.2.10-beta.20261106-nomount-armeabi-v7a.zip
a23b020541b3eca64e5c08988bae99f50600fdfdc282493e42395b0463f8aa46  openlist-runsv-4.2.10-beta.20261106-nomount-x86_64.zip
a365ae22ba8cce6be3333692a11ecabf7ed771558624f39f3a938cda705121d5  openlist-runsv-4.2.10-beta.20261106-nomount-x86.zip
83897b25b767f0265d1ef21bb5154a9dbe14a041b24f90841afd880ed7e26de6  openlist-runsv-4.2.10-beta.20261106-mount-arm64-v8a.zip
d430d69c7a0d5a358f040a95e408bbcf3593e6abc5cc6089e0148b7fc132e736  openlist-runsv-4.2.10-beta.20261106-mount-armeabi-v7a.zip
ccdbcc6c8e8467b9f23111da86b0effe8b0f5dff370723f25674833a16369d84  openlist-runsv-4.2.10-beta.20261106-mount-x86_64.zip
f5b6f9203762769b269b74391adeaa41062b8b28f00ceacab81a0159ff083ab0  openlist-runsv-4.2.10-beta.20261106-mount-x86.zip
```
