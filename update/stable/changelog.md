## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | stable |
| Module version | 4.2.9 |
| OpenList upstream | [v4.2.9](https://github.com/OpenListTeam/OpenList/releases/tag/v4.2.9) |
| Upstream build time | 2026-10-24T15:58:43Z |

The module version and versionCode are derived from the upstream OpenList release.

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
cad17b9dafdd008df2eabbb04426c549e833cd3b629827cd9f408a1d0f915446  openlist-runsv-4.2.9-nomount-arm64-v8a.zip
a84b2f7ac0774f3af45e4c7e903331ad34ad11d241f3561bbc81c03284926e96  openlist-runsv-4.2.9-nomount-armeabi-v7a.zip
a60802b9a4ac896d7cb14d50fa717179a9f9c4cfa41a21b157c6c2be343875e6  openlist-runsv-4.2.9-nomount-x86_64.zip
0a82d20aebf1544e17aef0d217640b61a972d5597525db094a7b169baff28963  openlist-runsv-4.2.9-nomount-x86.zip
f85968e08339ad42ca72d68af809b90e1def5150adcf2091c456b4e4f72fc22f  openlist-runsv-4.2.9-mount-arm64-v8a.zip
7efa629421095e81c76a468811e47be8c9dd3fe59cccb535754654d20529d064  openlist-runsv-4.2.9-mount-armeabi-v7a.zip
3cdb2be8959396f50662074eabacdd93d6c2e1f3b05bb904454cdb608ed3474f  openlist-runsv-4.2.9-mount-x86_64.zip
7fc002d95f0401d755ae71f2b030e43701890537a2e3c72cee036536c6f77cbb  openlist-runsv-4.2.9-mount-x86.zip
```
