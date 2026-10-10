## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | prerelease |
| Module version | 4.2.7-beta.20261010 |
| OpenList upstream | [beta](https://github.com/OpenListTeam/OpenList/releases/tag/beta) |
| Upstream build time | 2026-10-10T03:54:23Z |

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
b881dfdf6ee0c907b3a3eb047381d55910e218918af0318be669b9539af0e612  openlist-runsv-4.2.7-beta.20261010-nomount-arm64-v8a.zip
e1fefdb271c9f8030c63f16ecb0b5a0ff89a5880784b1116095ec6f3a5c51112  openlist-runsv-4.2.7-beta.20261010-nomount-armeabi-v7a.zip
2ec81cb5a0f169e864d410416e71f16f9c69ac1e32142f58c68864ae40251c67  openlist-runsv-4.2.7-beta.20261010-nomount-x86_64.zip
cf9c0be7052d4af47c18352067b482b682b39a136fc4d98a54e2fd1fad5b789a  openlist-runsv-4.2.7-beta.20261010-nomount-x86.zip
9f1636d48fe9729219cbf4de0bb3a8e94f0f84db5d305fddb55a13ac5635a1ec  openlist-runsv-4.2.7-beta.20261010-mount-arm64-v8a.zip
a0cd2b8d6508887c680c7e9ed5e49d28e9c726b706e3ba2d592451b2e963f9df  openlist-runsv-4.2.7-beta.20261010-mount-armeabi-v7a.zip
eb90452484921d68efb9b1d0df18cdc9ff7b1eaeef0c56e5a4cfdb7d4c4b002d  openlist-runsv-4.2.7-beta.20261010-mount-x86_64.zip
41206eab0df0672fe590844ec4c58bd8b8cce34f15eff0988700a8f15a761f03  openlist-runsv-4.2.7-beta.20261010-mount-x86.zip
```
