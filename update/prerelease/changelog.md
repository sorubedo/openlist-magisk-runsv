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
cbcc288ed88b874e09996bb3ba6050a74758d83cbadeec310dd5e3eb9e82e02c  openlist-runsv-4.2.10-beta.20261117-nomount-arm64-v8a.zip
282772fb3cee9ead1f13c9b8e83c6cc6a72cde4a5fb22c13033a3b6f651a8ca5  openlist-runsv-4.2.10-beta.20261117-nomount-armeabi-v7a.zip
e8ced5fe20e50e92154831d702f092d561af596a35a4744837077b31a6689895  openlist-runsv-4.2.10-beta.20261117-nomount-x86_64.zip
ae62ad6bf73980f7d39de81d6c2f5b368697a5fb8e3c307bda88d24358c6e6b8  openlist-runsv-4.2.10-beta.20261117-nomount-x86.zip
3a3939f2b91f1a00bfcb5e5bb88d9efe5b8a3cf9ef30e2069e215f9dcd904435  openlist-runsv-4.2.10-beta.20261117-mount-arm64-v8a.zip
55be3955e0b4a99fd890a1e005720199de4a735146f23713f0414de84e09d34a  openlist-runsv-4.2.10-beta.20261117-mount-armeabi-v7a.zip
eff54b7242b9ae662666dd098ee1c189526fa190592fce7350e0b69b400fea79  openlist-runsv-4.2.10-beta.20261117-mount-x86_64.zip
dd19cacd17f1cb1e8d5471ffdf430ada05850431151283bf95bd7a504c10e625  openlist-runsv-4.2.10-beta.20261117-mount-x86.zip
```
