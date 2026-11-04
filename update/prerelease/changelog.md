## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | prerelease |
| Module version | 4.2.10-beta.20261030 |
| OpenList upstream | [beta](https://github.com/OpenListTeam/OpenList/releases/tag/beta) |
| Upstream build time | 2026-10-30T04:33:49Z |

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
e95f92089ab591d1594a4e684ec16947ef237d549aed90dcaebd4408bdfb6194  openlist-runsv-4.2.10-beta.20261030-nomount-arm64-v8a.zip
7914b401bf1debf4d6b9938124ff31ec3567503f1d954572017eee5cfe21e5d6  openlist-runsv-4.2.10-beta.20261030-nomount-armeabi-v7a.zip
6429b1231478863954c57d9d7f8f66112e78393f5ece5babfa2d27034c40931b  openlist-runsv-4.2.10-beta.20261030-nomount-x86_64.zip
b290c1cec30de38aab92fccca7028a6260631141347cfe554d08a1d9e24180fe  openlist-runsv-4.2.10-beta.20261030-nomount-x86.zip
3cec83c162c177c21e2ceba82284744800aa98a6545ce5e88c943abedb3a743c  openlist-runsv-4.2.10-beta.20261030-mount-arm64-v8a.zip
9044ccb218fc61e6399184248d9a0b3239c71afd085c7f297832ceaf8b009e3a  openlist-runsv-4.2.10-beta.20261030-mount-armeabi-v7a.zip
c2d9651669f768180131ae4ebeda3e370fe707a00601de8c4d6d3d9ed3cd14ba  openlist-runsv-4.2.10-beta.20261030-mount-x86_64.zip
5b89d49107c0c383806cbc45af1c5e16e14ffb8bda941e0295f1fedc895d4555  openlist-runsv-4.2.10-beta.20261030-mount-x86.zip
```
