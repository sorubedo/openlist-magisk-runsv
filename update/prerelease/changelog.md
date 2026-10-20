## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | prerelease |
| Module version | 4.2.8-beta.20261020 |
| OpenList upstream | [beta](https://github.com/OpenListTeam/OpenList/releases/tag/beta) |
| Upstream build time | 2026-10-20T03:12:10Z |

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
38b4206d75b099ad179085f98c8f52521a1e46163638e8c08876b111c1cf1060  openlist-runsv-4.2.8-beta.20261020-nomount-arm64-v8a.zip
40773a19a8921df41ec98628be182f8bc8c6e1118bf97820c308da39157bc337  openlist-runsv-4.2.8-beta.20261020-nomount-armeabi-v7a.zip
e5d4fd248f9e9651e07dde443969fe2e7fad5e393ac13bfb8bc7311eb65c9fe8  openlist-runsv-4.2.8-beta.20261020-nomount-x86_64.zip
c1f779c790b41e2fed8b0d31db2773e959aa462f8160bf2e7ad4cd4dd9c83dc0  openlist-runsv-4.2.8-beta.20261020-nomount-x86.zip
1533463b0f162df679de7341e6695cf9d572815fdddf94b9f807e4c16465017e  openlist-runsv-4.2.8-beta.20261020-mount-arm64-v8a.zip
be39f881bd1dc921532059534f834704629bf65e69ed8dba7dabee42fee5658a  openlist-runsv-4.2.8-beta.20261020-mount-armeabi-v7a.zip
5ff228889ea33b54f4ec4f8085ebd570daa792b1f620111d6483399245b06c12  openlist-runsv-4.2.8-beta.20261020-mount-x86_64.zip
0351dd2d2105dce4650b428b807516e7c96c1c23cfa558e83ff4ee8feebbbf09  openlist-runsv-4.2.8-beta.20261020-mount-x86.zip
```
