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
7efd110fc2c9d97d822ffb4877ad685ec4411d0cc570fc89cbc670390ee8c8c2  openlist-runsv-4.2.10-beta.20261117-nomount-arm64-v8a.zip
6a15d07a683123716c5a75d0a52e44e14bd33e3af7bdc3ba8696a8b272b6d397  openlist-runsv-4.2.10-beta.20261117-nomount-armeabi-v7a.zip
dea7dd194e361a4e4774c5d357ab9f48ab6021e872ec56b7c66888e6251997cd  openlist-runsv-4.2.10-beta.20261117-nomount-x86_64.zip
49523c646e8b22f2297a3ab7ecb8b167c827496923cdc388dd8fe1c1ffc4e609  openlist-runsv-4.2.10-beta.20261117-nomount-x86.zip
5e412da5b89fca24b884fc7944a8fef763a5c5c8337ddd59a6f8bebfa10182c9  openlist-runsv-4.2.10-beta.20261117-mount-arm64-v8a.zip
267cb2c8a3351e6c3cced5abfbea1607941adc40ab23486d05d237ee866c7748  openlist-runsv-4.2.10-beta.20261117-mount-armeabi-v7a.zip
c9cd9e1268f09de7284dd7aa721b219e866abeaa1ff610fdbf5bc8af41a44700  openlist-runsv-4.2.10-beta.20261117-mount-x86_64.zip
bbd8e0ace7bc28d62aa78fd3d648d2ec4b0400db702a7b5a0dfef4a5095c0d4b  openlist-runsv-4.2.10-beta.20261117-mount-x86.zip
```
