## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | prerelease |
| Module version | 4.2.8-beta.20261020 |
| OpenList upstream | [beta](https://github.com/OpenListTeam/OpenList/releases/tag/beta) |
| Upstream build time | 2026-10-20T14:23:51Z |

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
2f5847e2ac2963e16013cc2e84b18b92d3df6abb9d451e9f793b7408b41a3bae  openlist-runsv-4.2.8-beta.20261020-nomount-arm64-v8a.zip
c0500eb34a86c5abf364e85454179632bf2c606c199591a46db472617f413ffc  openlist-runsv-4.2.8-beta.20261020-nomount-armeabi-v7a.zip
95dd76c1a54e7360750e51a1f9d9ea740ddedc08d6220f859453018bbced4422  openlist-runsv-4.2.8-beta.20261020-nomount-x86_64.zip
c938c453f06d4f8302bd455728c78b1254fb3e07b4a216117a516d71aa950aa5  openlist-runsv-4.2.8-beta.20261020-nomount-x86.zip
04307ed8a0c13f723491fac0544fa8127abfeed8c2b5a1670cfa67cc2d28a71b  openlist-runsv-4.2.8-beta.20261020-mount-arm64-v8a.zip
e045817aecec38238cff65eb26c0128745c7cb395838dc79c374431961afd30f  openlist-runsv-4.2.8-beta.20261020-mount-armeabi-v7a.zip
e34e7415f708946d5f6f6195f2d6e80914895c51dc1cfa9c5703705293b880d5  openlist-runsv-4.2.8-beta.20261020-mount-x86_64.zip
31bfa46acf4021b2e7fbf21dd9c4967e64948af1cd2472da6e315205495dda5b  openlist-runsv-4.2.8-beta.20261020-mount-x86.zip
```
