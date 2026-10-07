## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | stable |
| Module version | 4.2.6 |
| OpenList upstream | [v4.2.6](https://github.com/OpenListTeam/OpenList/releases/tag/v4.2.6) |
| Upstream build time | 2026-09-01T14:58:15Z |

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
c391e11a3475bcddc6d67be1142ec8f4ada486b56180bebd505519fe02ff1a94  openlist-runsv-4.2.6-nomount-arm64-v8a.zip
95b2276d6b36b67894c2da80892a28cc8b65fe36c99d01499fc48dfc463ea562  openlist-runsv-4.2.6-nomount-armeabi-v7a.zip
e7a82eca3060a1e3af88057c8bcc151f553d264e50c76e01aae3bfdb2aa779c6  openlist-runsv-4.2.6-nomount-x86_64.zip
dadbbead36f0bd25b420d770bbf26d094e53e93e325972dfca373c3a3631c4a1  openlist-runsv-4.2.6-nomount-x86.zip
d8db1261516bf289b2effc8af591435393ba9a5077b32090be21dd09365b74d3  openlist-runsv-4.2.6-mount-arm64-v8a.zip
f34f66e50d49592ccec63b35866047dab2cb716d695c562e51b654d17be61e75  openlist-runsv-4.2.6-mount-armeabi-v7a.zip
638525d53b0eb918bba8e840d1a1e5ad64fe07e9f70b0bd0271bb3a645a6e458  openlist-runsv-4.2.6-mount-x86_64.zip
6306f326131d2a8c04cedfcdc676d34bcaa0b1d0d8aa0e9fdafd3dfdef7801e9  openlist-runsv-4.2.6-mount-x86.zip
```
