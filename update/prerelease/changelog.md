## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | prerelease |
| Module version | 4.2.10-beta.20261027 |
| OpenList upstream | [beta](https://github.com/OpenListTeam/OpenList/releases/tag/beta) |
| Upstream build time | 2026-10-27T01:41:43Z |

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
16fcf53f8534c3511873dae6dad0b9ed0aa74b6fb4ae806a330ac1dcffed30ff  openlist-runsv-4.2.10-beta.20261027-nomount-arm64-v8a.zip
347dc07937b1fc85c10cd33437e16656b8e21d0c50b5ce319edd5a53f338d664  openlist-runsv-4.2.10-beta.20261027-nomount-armeabi-v7a.zip
58575393956990395569a5d51e764e22a12fbdf255c97cb32ed47811b135a9bf  openlist-runsv-4.2.10-beta.20261027-nomount-x86_64.zip
6b63f3ef0776d44f99c097e97aabe661f461baec69e54092b5443f1bc68fce28  openlist-runsv-4.2.10-beta.20261027-nomount-x86.zip
1f03b268a2d48c576692e3106ad134fb022f640b6e5327cfe8b14ccd580aa911  openlist-runsv-4.2.10-beta.20261027-mount-arm64-v8a.zip
7909a78ef2bd545ee88dba96e032fbfcfa58322f57296dd4a4c61fcfdf71725b  openlist-runsv-4.2.10-beta.20261027-mount-armeabi-v7a.zip
6adc2b36d2eb24899f986aacd56d00e1b4a7f075c3e76f7fdb671f14da7a8ab9  openlist-runsv-4.2.10-beta.20261027-mount-x86_64.zip
54870655b53d9780cdf8d0c1d3f0f1f858ef208c275d306130a285d347a01de3  openlist-runsv-4.2.10-beta.20261027-mount-x86.zip
```
