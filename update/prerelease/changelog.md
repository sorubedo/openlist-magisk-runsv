## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | prerelease |
| Module version | 4.2.10-beta.20261028 |
| OpenList upstream | [beta](https://github.com/OpenListTeam/OpenList/releases/tag/beta) |
| Upstream build time | 2026-10-28T04:30:56Z |

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
03672b8cf8ceef3c310b7923dc4a5940a2ff24ddf415a4dff4d45a04dcc70911  openlist-runsv-4.2.10-beta.20261028-nomount-arm64-v8a.zip
2f20d913c09c292d35f00e78dc4e49e41153860160b9794831c0557f72527176  openlist-runsv-4.2.10-beta.20261028-nomount-armeabi-v7a.zip
60a15af161cceab688cde3ab714ba3cfcd65dba245971ea148f7652f5d9cf85d  openlist-runsv-4.2.10-beta.20261028-nomount-x86_64.zip
53992e843103eef4ac7540c8aa0dd9a7b01da9ceadaa56c49b2d70ed3f4cbc1a  openlist-runsv-4.2.10-beta.20261028-nomount-x86.zip
016c2a8d31e24c542cea990dcd8714c24d2479b82a18ac182913fbcda5a38d3b  openlist-runsv-4.2.10-beta.20261028-mount-arm64-v8a.zip
d06cbb58ce009d0a8232d80559074c202faf796c9f74f9cce98d7b624cda2668  openlist-runsv-4.2.10-beta.20261028-mount-armeabi-v7a.zip
0cf24760f547c385c864267f19eb633d64847c2aa9abe2d92d5a8608dd23c685  openlist-runsv-4.2.10-beta.20261028-mount-x86_64.zip
52912679bbc78d56f02089a31989d2470720deb399eab1da26f0684ed5251a2a  openlist-runsv-4.2.10-beta.20261028-mount-x86.zip
```
