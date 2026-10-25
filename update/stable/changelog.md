## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | stable |
| Module version | 4.2.8 |
| OpenList upstream | [v4.2.8](https://github.com/OpenListTeam/OpenList/releases/tag/v4.2.8) |
| Upstream build time | 2026-10-24T09:34:29Z |

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
63462b20ae39bc6f31c7894ba8d3c6c78891c18d264aaf13843da648c09fd020  openlist-runsv-4.2.8-nomount-arm64-v8a.zip
308a4caa3828a92c51d1315cfd8023260db25d06f34355cc23f292e63e128204  openlist-runsv-4.2.8-nomount-armeabi-v7a.zip
d3b52b2ac2732b4dfdeb76dd12995a854a1397a86187bb92c870cb8a1822ebf0  openlist-runsv-4.2.8-nomount-x86_64.zip
ae684d74b276fce8a2e42be10c261c6a2736048da9aba7d5598ea5e57838fdf2  openlist-runsv-4.2.8-nomount-x86.zip
9a9ae80a9767cd7de3d0e641d396d286db7b60e15ae4194793f0ba174c0e3161  openlist-runsv-4.2.8-mount-arm64-v8a.zip
46454f5ae87b25795a2fbbc071ce50006b46f0c8588e94758002858bafeb81b6  openlist-runsv-4.2.8-mount-armeabi-v7a.zip
4cb9718e38adaeb9d4b0eec5f8b69d19369b1d75f4b9ea16b2bb5808bb6bf249  openlist-runsv-4.2.8-mount-x86_64.zip
907350c3a34addbc3e9008ec4d2aa7bc48ed844bf48025f42cacf5783c966dab  openlist-runsv-4.2.8-mount-x86.zip
```
