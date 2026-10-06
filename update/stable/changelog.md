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
4df2a24a29324cdf85677a24b9614095f96dc8d94c1652e7aad8a712e135f632  openlist-runsv-4.2.6-nomount-arm64-v8a.zip
f139203de38ee792e034065e6a645f89e1be0ea0e33a1ac373ca23210815ed3a  openlist-runsv-4.2.6-nomount-armeabi-v7a.zip
0f93770bae85fce8422361e65b1f00e6afc0d14a21e371d8a9d3fddc8fc0417b  openlist-runsv-4.2.6-nomount-x86_64.zip
5f30c28372a68af07f5700cc05af9e1d85073aa6e5d0d76d8f0fb00c8eb5c049  openlist-runsv-4.2.6-nomount-x86.zip
70be72ffc9c8060e8aebd6165e504b988f2194b9f51b9076b2c1d2752e7cbb83  openlist-runsv-4.2.6-mount-arm64-v8a.zip
174e0545f11db56ebe2787c74f4c530475b6d5a0e5718360f129e3415b4aa04f  openlist-runsv-4.2.6-mount-armeabi-v7a.zip
858a312bdf969c7d1d391b2f54cf3cd2a1449d33afe50f682d4c0a3e3c7ef9ba  openlist-runsv-4.2.6-mount-x86_64.zip
0ccc527b5f6d8710aee72fd28bb2d2bfe2c681345b188107e131f2b1b844042d  openlist-runsv-4.2.6-mount-x86.zip
```
