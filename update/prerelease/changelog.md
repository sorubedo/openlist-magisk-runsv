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
c2f19900568e46c68874217277a1e64804aa672825deea5e6d717d72cc7ee195  openlist-runsv-4.2.7-beta.20261003-nomount-arm64-v8a.zip
6b681b76622b9c55e76f63d8c4af024f7e8f967671fa4f3f2fc22529cc375338  openlist-runsv-4.2.7-beta.20261003-nomount-armeabi-v7a.zip
f87e318872f3e1879c1ab440bca9e4f189d48a4b10c2fed5a53f4a2ba4247d31  openlist-runsv-4.2.7-beta.20261003-nomount-x86_64.zip
07be3f1425f857b89c6c7c0f6190d7c3b12f4e7811c98e9a5038232d954a16f1  openlist-runsv-4.2.7-beta.20261003-nomount-x86.zip
db28760740216f3b7a316e6d5fb3b1b3a55d65303c25ab1ba423f08dc558b8c0  openlist-runsv-4.2.7-beta.20261003-mount-arm64-v8a.zip
3adfbc7c8827bd7d24e8c4d4f7d43885874022937387d37d6847a3a38b3a0d68  openlist-runsv-4.2.7-beta.20261003-mount-armeabi-v7a.zip
3227472c405434b0c7ae83bd88a12a741eae4a646aa6714169ed269bdac28717  openlist-runsv-4.2.7-beta.20261003-mount-x86_64.zip
40376ce37495d56e7511bca9ab58a62253fc5e8ccb8b48facbf44b20d77de447  openlist-runsv-4.2.7-beta.20261003-mount-x86.zip
```
