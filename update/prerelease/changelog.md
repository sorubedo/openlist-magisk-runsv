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
93be52286eecfdca4cb2c770f273ca8db2a8181bc474eeea9638a1e8376f3af7  openlist-runsv-4.2.10-beta.20261113-nomount-arm64-v8a.zip
65d14ee6cd5f0da36bc5c45059f52adb5cb5343c634aba44d8532090f359ae74  openlist-runsv-4.2.10-beta.20261113-nomount-armeabi-v7a.zip
1ff3cf5e4718f602a9851a634c0dce1537849586b436d3be115b5a9419ce5c40  openlist-runsv-4.2.10-beta.20261113-nomount-x86_64.zip
88ff6bd45cf424e861495b21f5a8d665b54d4c55d919f8e37f1bacec6cbfb8cc  openlist-runsv-4.2.10-beta.20261113-nomount-x86.zip
726e3fbed9cd552fa7873452f205b07214220ce9480a19bd274727eea043bb26  openlist-runsv-4.2.10-beta.20261113-mount-arm64-v8a.zip
9dd238d262619738b503a1076eaeadb8b25f42dda7d5bdc709a2d275ec6718ce  openlist-runsv-4.2.10-beta.20261113-mount-armeabi-v7a.zip
ec5b22b8cb5358ee3c145e42d5d3529ca9e0cee9cf90a493cd66a12f73fe68b9  openlist-runsv-4.2.10-beta.20261113-mount-x86_64.zip
c753421328134f8cfb2e3eedcce9b473e5f788b017cec9c370221a138211351f  openlist-runsv-4.2.10-beta.20261113-mount-x86.zip
```
