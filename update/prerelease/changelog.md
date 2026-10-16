## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | prerelease |
| Module version | 4.2.7-beta.20261015 |
| OpenList upstream | [beta](https://github.com/OpenListTeam/OpenList/releases/tag/beta) |
| Upstream build time | 2026-10-15T14:18:40Z |

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
cdc703f40289b12129b6f067c462a22b1a7c2ec7f2b4dc30d30bf92c8b351434  openlist-runsv-4.2.7-beta.20261015-nomount-arm64-v8a.zip
4b3d7bd6bb75767b9f18ca5f3aa354905c679c63f341a6975b1fc75ad71e99cc  openlist-runsv-4.2.7-beta.20261015-nomount-armeabi-v7a.zip
2d852fad83b7d86d2d1fd27b84c98abdeac9b14e570cca9f741fe311df07e7db  openlist-runsv-4.2.7-beta.20261015-nomount-x86_64.zip
c03d9d9a8dec2235dc8443d11233ccf7ec8b50a4efa5cf87d45a9504318161a5  openlist-runsv-4.2.7-beta.20261015-nomount-x86.zip
55be38f40c93bdab67a1d13d88c541a23152ac10f09c8b60359034352149786a  openlist-runsv-4.2.7-beta.20261015-mount-arm64-v8a.zip
33d34c8879176604a838a12e8a9fcaadb7b8e93d650b97e538813ff63a3185f1  openlist-runsv-4.2.7-beta.20261015-mount-armeabi-v7a.zip
d7f5402545c3d8963cdda04d0fb593de7a7097d61525eeeb084e7a873ac0c4a9  openlist-runsv-4.2.7-beta.20261015-mount-x86_64.zip
05b830133ccc5af5d41e751991ac83ec89cb8fdcbfe0af5511a53809d2e2b107  openlist-runsv-4.2.7-beta.20261015-mount-x86.zip
```
