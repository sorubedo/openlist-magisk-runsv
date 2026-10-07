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
e84ca05d5515c379aab951206622a9e8090fce2b0cab9a86563e08450bc681a5  openlist-runsv-4.2.7-beta.20261003-nomount-arm64-v8a.zip
a436bfc74cd97cb46685a5a19260cca95acc53b5407885cf1d2cde53e7900ba4  openlist-runsv-4.2.7-beta.20261003-nomount-armeabi-v7a.zip
b7b434cfe5165d96677e2ba582ce3dabae1af6ed7cc7510b3a15f43d6b8b145e  openlist-runsv-4.2.7-beta.20261003-nomount-x86_64.zip
1456dc418bc7f4fe0637ac9b6ae659cf57b9f746443044c0b5d4476134a88b26  openlist-runsv-4.2.7-beta.20261003-nomount-x86.zip
99053f9bef925ae612952d408d53c58abba498a35a9dddcf97c18fe5671d0d48  openlist-runsv-4.2.7-beta.20261003-mount-arm64-v8a.zip
140c77e13b040bffc7581e07a4178e9b48a46385bcc285524d91a5b28fcc394f  openlist-runsv-4.2.7-beta.20261003-mount-armeabi-v7a.zip
fb78a893937baf56fa809012038dbf0fffaae9b82bab2598ddffd352b60b3510  openlist-runsv-4.2.7-beta.20261003-mount-x86_64.zip
95a15ed10b9a78de669ee724768cdfe824b449dd95182bdbc07049c7cf0507c2  openlist-runsv-4.2.7-beta.20261003-mount-x86.zip
```
