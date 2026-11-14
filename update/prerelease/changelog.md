## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | prerelease |
| Module version | 4.2.10-beta.20261113 |
| OpenList upstream | [beta](https://github.com/OpenListTeam/OpenList/releases/tag/beta) |
| Upstream build time | 2026-11-13T03:52:16Z |

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
52b4750dd396177fae5a2c2ed35cf819aab4ad3fbc0a63b8fed669a5334cae7b  openlist-runsv-4.2.10-beta.20261113-nomount-arm64-v8a.zip
0a83a8584e8f85135a9484108376508c2a5a3bda00f04c697639333e3568dec3  openlist-runsv-4.2.10-beta.20261113-nomount-armeabi-v7a.zip
ec2e9fb6d41edcce56ebd25b1972fc7202b48b4be4fc12fd33aae9ecf4fb91b8  openlist-runsv-4.2.10-beta.20261113-nomount-x86_64.zip
1d4c538ece22604edc2b8f8e138ab45cafa4145942b066bb34d104e3813c051d  openlist-runsv-4.2.10-beta.20261113-nomount-x86.zip
1187d8438f44d971604a40559c067e3cb089632b58a5ad930bbcf8a3dce85bdb  openlist-runsv-4.2.10-beta.20261113-mount-arm64-v8a.zip
831d54e18bd9ac066c81ee1b28c87ef5061725506ffc8dcdd2cb0a9d014441d0  openlist-runsv-4.2.10-beta.20261113-mount-armeabi-v7a.zip
3b1a0d11e5082f76de6a0b455657f7a0d16f3f9655d0ebce05cdcfc260b2df69  openlist-runsv-4.2.10-beta.20261113-mount-x86_64.zip
dd4daa2c563bc67189386470bc8d307f69f0c5344112d294cff07c9ef0aeba10  openlist-runsv-4.2.10-beta.20261113-mount-x86.zip
```
