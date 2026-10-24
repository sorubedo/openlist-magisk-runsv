## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | prerelease |
| Module version | 4.2.8-beta.20261023 |
| OpenList upstream | [beta](https://github.com/OpenListTeam/OpenList/releases/tag/beta) |
| Upstream build time | 2026-10-23T14:47:56Z |

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
1918b0efb00f7c28c5ce9b00647163c54d44a3a014411005d946f4ceaf7d2e7f  openlist-runsv-4.2.8-beta.20261023-nomount-arm64-v8a.zip
e69fc3986454fc0356d42870eb069ccb17ced31d181853b43052bad81c2eaec0  openlist-runsv-4.2.8-beta.20261023-nomount-armeabi-v7a.zip
b4d6a73d0c3a8f48c5c3cbd28aa40379966466f2a2123c8aa8d1998a1599e115  openlist-runsv-4.2.8-beta.20261023-nomount-x86_64.zip
932e15e22ca6fd1ff7a2f858eaf77f6b85a67cf991f11ef652f285cdb05423f2  openlist-runsv-4.2.8-beta.20261023-nomount-x86.zip
e78d69896cd166fc42b7c3a05ec1094d08bd19b3d2ae1eadbfd68916c10c3bf1  openlist-runsv-4.2.8-beta.20261023-mount-arm64-v8a.zip
b798e798a08d3f87e5b57c2c2d878c3b78303e4fc7388df30587e12849bddbf8  openlist-runsv-4.2.8-beta.20261023-mount-armeabi-v7a.zip
c7466d9dd19382964b95b7c6fa989b8d2f46a72d60f76b4029f940c6f0524c10  openlist-runsv-4.2.8-beta.20261023-mount-x86_64.zip
6c53835fd9bb23856f2e5908812d9c56b474cc8de3f962329a49b7f7599119b6  openlist-runsv-4.2.8-beta.20261023-mount-x86.zip
```
