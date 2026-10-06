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
1d4a2dc475e0c6b765c19f2fb85483affbc207d8138467b4c9ce8f7adaa5f634  openlist-runsv-4.2.6-nomount-arm64-v8a.zip
8c4220c192eda6b2cd87b80bfcf61ac54aee09631a625b25f8685cfeef8eed34  openlist-runsv-4.2.6-nomount-armeabi-v7a.zip
9ba32e571924d38db00da7e049451c7499fe82d3375f95da55fc70fb2523c724  openlist-runsv-4.2.6-nomount-x86_64.zip
fc1b914dc9fbaaf38695cf3d7c4114de9fd7890246a9265f221b7a012df64f5c  openlist-runsv-4.2.6-nomount-x86.zip
1126751b860557fecaa0a4b6d3953b8efb378cc4427ff41f4038af1faa89c332  openlist-runsv-4.2.6-mount-arm64-v8a.zip
89b0cd993b6325c95c5ce7c0353a45de204d46ed4c138b873dcb9caeae50ee95  openlist-runsv-4.2.6-mount-armeabi-v7a.zip
31971b756f35f041c25ca04732b0225d1db7fd02d35c763463b703a84c3edec7  openlist-runsv-4.2.6-mount-x86_64.zip
f683ac78a60600b7e3035cd07cc0a343b0ab7791d147f4afbf13420fb56e9cf7  openlist-runsv-4.2.6-mount-x86.zip
```
