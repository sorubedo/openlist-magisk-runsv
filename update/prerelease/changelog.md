## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | prerelease |
| Module version | 4.2.10-beta.20261117 |
| OpenList upstream | [beta](https://github.com/OpenListTeam/OpenList/releases/tag/beta) |
| Upstream build time | 2026-11-17T09:41:04Z |

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
6c9cf932da720c9f42c0c7c3c4c1d539c04c5ef2d03e32da242b1def0e94f36b  openlist-runsv-4.2.10-beta.20261117-nomount-arm64-v8a.zip
9927318bcf6d3a61649da6d5c110eeb423bd055550b8094aa6825ba67c268d6d  openlist-runsv-4.2.10-beta.20261117-nomount-armeabi-v7a.zip
bd3ea1b7062cb28d5018ef4dab3f839ddce962d227a371e1f67edaae0660ea59  openlist-runsv-4.2.10-beta.20261117-nomount-x86_64.zip
71df87f2172bf176604cef5d779204f94682564bb773a4edf789ed98064634cf  openlist-runsv-4.2.10-beta.20261117-nomount-x86.zip
6e0eed96830b94fe2bfe208ee6ad053dd7a77516e5b1f7999734ea2b9252e647  openlist-runsv-4.2.10-beta.20261117-mount-arm64-v8a.zip
3a2fa013558d03e0eb7ee5b25675db0c68a334031b50d6d27a16860997a073fa  openlist-runsv-4.2.10-beta.20261117-mount-armeabi-v7a.zip
da0ee006ac6d831ac97cb3c40eb682295042a30f649dc00207286b416fa11044  openlist-runsv-4.2.10-beta.20261117-mount-x86_64.zip
67db61db7253995979885c480eb3f6469f67a17722a395f46a148b60abf9cd8c  openlist-runsv-4.2.10-beta.20261117-mount-x86.zip
```
