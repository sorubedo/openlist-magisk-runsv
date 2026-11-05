## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | prerelease |
| Module version | 4.2.10-beta.20261104 |
| OpenList upstream | [beta](https://github.com/OpenListTeam/OpenList/releases/tag/beta) |
| Upstream build time | 2026-11-04T05:23:35Z |

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
90ae30ab951fe50e834afd03e51eb34380ecd66e9df73cc4326c11075030a6a4  openlist-runsv-4.2.10-beta.20261104-nomount-arm64-v8a.zip
05259b96935f53ebb505986645c9fa378763a1be9031a29dc93facaaac60ff1b  openlist-runsv-4.2.10-beta.20261104-nomount-armeabi-v7a.zip
6ce89dce5b1adaf30cff08b331ff7d6546120b9a2db95ef08aac1124f9bab658  openlist-runsv-4.2.10-beta.20261104-nomount-x86_64.zip
7dfc4b522be894446621a1f93bc6403bc3c7c3a47f774def54407850ccc5a0a0  openlist-runsv-4.2.10-beta.20261104-nomount-x86.zip
a707b3d3dbeaa0387f5be13250f1cb8864eab4405b451e1cd0418037779d3089  openlist-runsv-4.2.10-beta.20261104-mount-arm64-v8a.zip
59485b39d94046affe6b1521aff7e6bdeddb278f4561888652a1371ca1ee7d84  openlist-runsv-4.2.10-beta.20261104-mount-armeabi-v7a.zip
97ddb3e4b3ee3d0cb5f4c31084ced1e6c5507b605fd9137377bdeb385a081c68  openlist-runsv-4.2.10-beta.20261104-mount-x86_64.zip
e70abb8e724d95bd9bc5a69afa1a125c2be09231fa6930dcc67799dc3daeb115  openlist-runsv-4.2.10-beta.20261104-mount-x86.zip
```
