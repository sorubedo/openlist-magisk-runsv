## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | stable |
| Module version | 4.2.6 |
| OpenList upstream | [v4.2.6](https://github.com/OpenListTeam/OpenList/releases/tag/v4.2.6) |
| Upstream build time | 2026-09-01T14:58:15Z |

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
ee4b5d9333c89962a8977832188e9aa67c942b389be4e6573cb00e22aec2b951  openlist-runsv-4.2.6-nomount-arm64-v8a.zip
44ba90827ed3ae7f15d5177e18a13a13fc57ebd2a97c37bd4783ecd5aeeff56e  openlist-runsv-4.2.6-nomount-armeabi-v7a.zip
7abe409d155d5e0f5320f3080f7484309dec1ec097e05c533b6cb4106dbf99ad  openlist-runsv-4.2.6-nomount-x86_64.zip
4179bb3873728c28069f452ff78ba7b780448fef6f1990fe00d5dcebdd79d012  openlist-runsv-4.2.6-nomount-x86.zip
52888d05ec752fd8672b3f882b207cf03d32481a14bf2016b986ec3a06de5c70  openlist-runsv-4.2.6-mount-arm64-v8a.zip
e77accf63db6691e38fee5fc3e808aa8314987cca337470e9f5777b82dfda566  openlist-runsv-4.2.6-mount-armeabi-v7a.zip
694175135110e6a1abd6124a40cb37a29d8c5416682d7f07258f220b1833ef07  openlist-runsv-4.2.6-mount-x86_64.zip
5d0b2e194523958f55094705692b8ad0694c318f87fefd242a73cd14b29f57e7  openlist-runsv-4.2.6-mount-x86.zip
```
