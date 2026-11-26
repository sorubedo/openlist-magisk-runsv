## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | prerelease |
| Module version | 4.2.11-beta.20261124 |
| OpenList upstream | [beta](https://github.com/OpenListTeam/OpenList/releases/tag/beta) |
| Upstream build time | 2026-11-24T04:16:40Z |

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
e7db80e83a98ff562d46920312a34d178daaf26fc05f5ff0fad4135b0cb4cc49  openlist-runsv-4.2.11-beta.20261124-nomount-arm64-v8a.zip
6e75c84ad98f4f3695fd0386ac10182a1fc9f94b2e23e5747e8bf5847c40643c  openlist-runsv-4.2.11-beta.20261124-nomount-armeabi-v7a.zip
49a114598509abd961cbe01541df437f876f6ad3f60946641a5e3c65d895bc62  openlist-runsv-4.2.11-beta.20261124-nomount-x86_64.zip
81adefc9eaba372d634f889b08580c5cd7b7753538b72decad372651fdd52c8b  openlist-runsv-4.2.11-beta.20261124-nomount-x86.zip
6bd21a4d448e288e36d090d9ec87273567ff671b932aed9458ed2248a58d65d5  openlist-runsv-4.2.11-beta.20261124-mount-arm64-v8a.zip
05c12d08b70aef232d43592be6d8e02c698cc859cf44d18fe8f52650f0a3b95f  openlist-runsv-4.2.11-beta.20261124-mount-armeabi-v7a.zip
5eb4d1923219384ffee9c86dc5beaea1997bcaad298b37b6a416810d1b221777  openlist-runsv-4.2.11-beta.20261124-mount-x86_64.zip
ba205b5dc1851f595cc1314a8c04042ce5e932ad04511e3560db9dfcad462194  openlist-runsv-4.2.11-beta.20261124-mount-x86.zip
```
