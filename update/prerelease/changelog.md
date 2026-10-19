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
42cacbf3e99f7cc11da07be5b2339bc05a6e325283ec4ef504f94d05db8a7775  openlist-runsv-4.2.7-beta.20261015-nomount-arm64-v8a.zip
e12b4ccff75604a85674cecf3f0a819071cc4139bc7c4665b27f63c72fbe2db6  openlist-runsv-4.2.7-beta.20261015-nomount-armeabi-v7a.zip
be7eb5decf5628f7be77901b28cfc40fe144654d2a5d95e4add9bf0682394a47  openlist-runsv-4.2.7-beta.20261015-nomount-x86_64.zip
fad2bfe4b25b56bb11b1d7ddaf456201ef8b2bf3f06c03fdc2bd1adae6a85442  openlist-runsv-4.2.7-beta.20261015-nomount-x86.zip
0a53143227987a6438f54fec1c5e9105114d70b7563ba79b3e2ca057cd0394de  openlist-runsv-4.2.7-beta.20261015-mount-arm64-v8a.zip
3606dbd92f5d4fd2f3758d0046d3a2fd0fe7e9d8b4c4f833f3df4ad1676f7766  openlist-runsv-4.2.7-beta.20261015-mount-armeabi-v7a.zip
98de49ac0c7133f87edbc9a3004cf6004516f94b36827c500a5498ad944160fb  openlist-runsv-4.2.7-beta.20261015-mount-x86_64.zip
da0c23bfd34fdc0a48c2b0f749f4eda8fefdf34112166f5cd75b4571890d80ed  openlist-runsv-4.2.7-beta.20261015-mount-x86.zip
```
