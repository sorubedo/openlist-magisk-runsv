## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | prerelease |
| Module version | 4.2.11-beta.20261124 |
| OpenList upstream | [beta](https://github.com/OpenListTeam/OpenList/releases/tag/beta) |
| Upstream build time | 2026-11-24T04:16:40Z |

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
c3a23084f5b96a9e5faab410443afdd07e18e54041147dc4bb7c75949dbe142a  openlist-runsv-4.2.11-beta.20261124-nomount-arm64-v8a.zip
b65aaf4bdb725ace96a3ae1d182bd085051a20934026fc75e7bbb66c8267ccf3  openlist-runsv-4.2.11-beta.20261124-nomount-armeabi-v7a.zip
e84132ef119d8b2d030117115f5bb2d3f632f72e0b148d7d447e2185e020f3e7  openlist-runsv-4.2.11-beta.20261124-nomount-x86_64.zip
6cbd6b98f5859173b1fae59c6526edba0c33d86796d57ddd2d7ea3c44e87ab16  openlist-runsv-4.2.11-beta.20261124-nomount-x86.zip
8489fb94e8d4727c470576e60584a3ee905c9af76a946a470881bc139dcc91ec  openlist-runsv-4.2.11-beta.20261124-mount-arm64-v8a.zip
0e9a56ea750ffc489ad070a3827c74060b0f45244f9989fc056f7243ba1affbc  openlist-runsv-4.2.11-beta.20261124-mount-armeabi-v7a.zip
a544b3a990feb44fa1d682a62854e377ee89f0d900e8bdd55a20573d1d34fb0b  openlist-runsv-4.2.11-beta.20261124-mount-x86_64.zip
af0af3782229931d5263bedfb45b9313d86c52abd55d972bc915452323f7a699  openlist-runsv-4.2.11-beta.20261124-mount-x86.zip
```
