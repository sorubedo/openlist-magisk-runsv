## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | prerelease |
| Module version | 4.2.10-beta.20261030 |
| OpenList upstream | [beta](https://github.com/OpenListTeam/OpenList/releases/tag/beta) |
| Upstream build time | 2026-10-30T04:33:49Z |

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
882319536c88eab93462caabce791dd9ea4929002368380cbd17782707a3e4f4  openlist-runsv-4.2.10-beta.20261030-nomount-arm64-v8a.zip
3d3bc77063445c1f9205c44bc151ef49eba0a18d0441209cf77b68f2b014143a  openlist-runsv-4.2.10-beta.20261030-nomount-armeabi-v7a.zip
de8ed6dd5e084ee610f70951db227ea2171fa8b74bd3202007ec72284ba50754  openlist-runsv-4.2.10-beta.20261030-nomount-x86_64.zip
f6d739f82ffcab2362e7d08645a93a1713185dfc04ab5ee747d04d947973e7bb  openlist-runsv-4.2.10-beta.20261030-nomount-x86.zip
b1b3ddafe7c9a537ab26d120a99382d8e13cbd790f6891579e0d8e62af747f28  openlist-runsv-4.2.10-beta.20261030-mount-arm64-v8a.zip
4e0d8a22bdaba133d62f08145755d05a424dc6a9d31b79e54833fb9fa9bdecdf  openlist-runsv-4.2.10-beta.20261030-mount-armeabi-v7a.zip
075a4c409230faf2c8b2329b84357ffa2db081eb76001e2075a19f2361d1e1a4  openlist-runsv-4.2.10-beta.20261030-mount-x86_64.zip
f5dec44bcf167e3c52e14fa8bc2a1655a27d9fbe5b2415326da149f90aa913a6  openlist-runsv-4.2.10-beta.20261030-mount-x86.zip
```
