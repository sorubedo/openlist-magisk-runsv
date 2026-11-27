## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | prerelease |
| Module version | 4.2.11-beta.20261124 |
| OpenList upstream | [beta](https://github.com/OpenListTeam/OpenList/releases/tag/beta) |
| Upstream build time | 2026-11-24T04:16:40Z |

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
41b372d8d8318b83ed84457190d8ecd8cdaaf2b6b9cb3a0571a863bf539012dd  openlist-runsv-4.2.11-beta.20261124-nomount-arm64-v8a.zip
96c44e68321ded2a64664be28864555a7b40faa5519f7e6b785251090de6dabc  openlist-runsv-4.2.11-beta.20261124-nomount-armeabi-v7a.zip
9eb7cf3bebd2629cbce9832b049674c28eac3bdefb8d923f0f312cbee7f9de28  openlist-runsv-4.2.11-beta.20261124-nomount-x86_64.zip
bfcf8c7c1957c20a48fb41ccd6e9233091b15135c4852ef97038eacfc825a42c  openlist-runsv-4.2.11-beta.20261124-nomount-x86.zip
33488429e01195bdf5cd891d3cd8348cdb01b899b6cb15041e8100bcefabd862  openlist-runsv-4.2.11-beta.20261124-mount-arm64-v8a.zip
cb3bcefd06301d2ba332bd4e1295562e29de2928f3888b8a8d19daf14ecf33c4  openlist-runsv-4.2.11-beta.20261124-mount-armeabi-v7a.zip
d1308f3e795b96c882307180f1d861c4bf5d52e98a6f2bc39c7c4ef7cc636dc7  openlist-runsv-4.2.11-beta.20261124-mount-x86_64.zip
2a0836af4779a057fd46bae6e811201d2c74e3a486a8823385c3d259f26ef71f  openlist-runsv-4.2.11-beta.20261124-mount-x86.zip
```
