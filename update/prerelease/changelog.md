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
d10dc09566a30bd327d0837538f94f398d79c39ae6d3805d04dc06b16e9f507a  openlist-runsv-4.2.10-beta.20261117-nomount-arm64-v8a.zip
cff924f9fdfd068796061fa73983025a81e91ed9267105844b558b83c618a186  openlist-runsv-4.2.10-beta.20261117-nomount-armeabi-v7a.zip
a05a498b85d86db5792d8706b3208b64d71db69a5b75f5ebc0427818a52fa8b8  openlist-runsv-4.2.10-beta.20261117-nomount-x86_64.zip
09983e0a7686ed122267271bb731be475772cdf0b302fe1a51746b81448086b6  openlist-runsv-4.2.10-beta.20261117-nomount-x86.zip
de2ead2af4649b90a4082b64d445455a4a483f6dfd3275e6453a0e6e775482aa  openlist-runsv-4.2.10-beta.20261117-mount-arm64-v8a.zip
aea6c44ddbe8f63fa07d76694927c8f58475538bf5c4331e32f110dc592753d9  openlist-runsv-4.2.10-beta.20261117-mount-armeabi-v7a.zip
75cefd330783b45698d2e8ee963c24ab6b387a0b9080896592040007722a6770  openlist-runsv-4.2.10-beta.20261117-mount-x86_64.zip
b3a1948d189d88cef22be35e2cab2704f656096b6b23f4eb2525863db0b7c140  openlist-runsv-4.2.10-beta.20261117-mount-x86.zip
```
