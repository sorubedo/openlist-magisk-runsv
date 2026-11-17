## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | prerelease |
| Module version | 4.2.10-beta.20261116 |
| OpenList upstream | [beta](https://github.com/OpenListTeam/OpenList/releases/tag/beta) |
| Upstream build time | 2026-11-16T10:34:33Z |

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
0f6d91fecaaec8edb22a54b7f231b94c6aed403651a7af41cccb4d2d28d2c3cb  openlist-runsv-4.2.10-beta.20261116-nomount-arm64-v8a.zip
f7e95b68ff34bdbebf44abfd5cf09a6c084f757a0cb2eb7e2dbc22de12a74d64  openlist-runsv-4.2.10-beta.20261116-nomount-armeabi-v7a.zip
84f28c6af41e689a6de5575c74403a517010f23229ad6a547ecc540b03a4e34b  openlist-runsv-4.2.10-beta.20261116-nomount-x86_64.zip
b25e4f6083485d81e9454af25ec4a3f2c1ef08b6ca4b83d8e8953fd9fde99bd7  openlist-runsv-4.2.10-beta.20261116-nomount-x86.zip
5ebc69809a04fe260283d386d6f5c14137e127f6190e2adf635395a1253a080b  openlist-runsv-4.2.10-beta.20261116-mount-arm64-v8a.zip
96ff3b97968f5363e4a76c1794c0a3ddb6d7d026edfd0d379eb0781354f3f3c6  openlist-runsv-4.2.10-beta.20261116-mount-armeabi-v7a.zip
682765b67a56ae298ddf0fbf80537ab6ac5804739c0ab6d72f7656131619294b  openlist-runsv-4.2.10-beta.20261116-mount-x86_64.zip
d9894cd6379b6aa29a0a1d1f6631ab9375eb46f0f6cd7cff443e64d79ffa9a20  openlist-runsv-4.2.10-beta.20261116-mount-x86.zip
```
