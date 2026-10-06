## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | prerelease |
| Module version | 4.2.7-beta.20261003 |
| OpenList upstream | [beta](https://github.com/OpenListTeam/OpenList/releases/tag/beta) |
| Upstream build time | 2026-10-03T07:45:29Z |

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
fa5090ee4595562217e2239b1fca39b6203e474ef84550afc48dddb31d09dddc  openlist-runsv-4.2.7-beta.20261003-nomount-arm64-v8a.zip
142e9186ec1837a8a8cf3dd8e157e14b56bc70b94885c916c216058597230a29  openlist-runsv-4.2.7-beta.20261003-nomount-armeabi-v7a.zip
b571a7c1bf604f04b3ac4cfbb0da17d773f2c95770e8015ee99a7b17117e58e0  openlist-runsv-4.2.7-beta.20261003-nomount-x86_64.zip
261eabcbfed228c16cd34a37645f2e89727d414e5f5bfb0e56c9b101267f1045  openlist-runsv-4.2.7-beta.20261003-nomount-x86.zip
5ff5f0b56d110f98b5f4f9098c011ce84e76e432c3a393f553593cd98218029d  openlist-runsv-4.2.7-beta.20261003-mount-arm64-v8a.zip
42f4f298230b091716e5f73e33d6ccfedcbe9d2000fae8754965fbaec6828e91  openlist-runsv-4.2.7-beta.20261003-mount-armeabi-v7a.zip
c77642da6e57f27c8da86117b70a4383c50f9f6a41509250ee1d52a3a24d1a55  openlist-runsv-4.2.7-beta.20261003-mount-x86_64.zip
3f97b73ba8179abea9b35f9bc30dc9bbf56e73c5cabe8c9c5e50f517eb28a8e4  openlist-runsv-4.2.7-beta.20261003-mount-x86.zip
```
