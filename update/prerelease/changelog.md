## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | prerelease |
| Module version | 4.2.10-beta.20261106 |
| OpenList upstream | [beta](https://github.com/OpenListTeam/OpenList/releases/tag/beta) |
| Upstream build time | 2026-11-06T04:48:12Z |

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
26997840746c8275cb55cf72e878ad357a5250ab6040bac581baf040d75f9fec  openlist-runsv-4.2.10-beta.20261106-nomount-arm64-v8a.zip
fa55a48f683c0277f23f1fdebd95e3f931fd83ba986bc19ef94693782c420a53  openlist-runsv-4.2.10-beta.20261106-nomount-armeabi-v7a.zip
c5753700474fb09ab2245572f9b8e17de713e375978bf0ef552a918732866605  openlist-runsv-4.2.10-beta.20261106-nomount-x86_64.zip
ad80f02563e396d7f047ad95ff93233d022d6874b180a5e1befa1d2a6779acca  openlist-runsv-4.2.10-beta.20261106-nomount-x86.zip
23c50aacd0d7e2cab39999a15e6a413a3e346c77d51b039bcacee42a522ad6f5  openlist-runsv-4.2.10-beta.20261106-mount-arm64-v8a.zip
540820a3f7732bbffa675a8d28add832934b6d6fa62f486048cdbfd127ab162e  openlist-runsv-4.2.10-beta.20261106-mount-armeabi-v7a.zip
4724d9ed479ae18baa8859fe30e2f06a14755ea5bb2e5ea7237ab627727353e2  openlist-runsv-4.2.10-beta.20261106-mount-x86_64.zip
983d6bae9cf14fd03e0f83357cc01bf12803d141c6d54d942d3ef8e111dd3717  openlist-runsv-4.2.10-beta.20261106-mount-x86.zip
```
