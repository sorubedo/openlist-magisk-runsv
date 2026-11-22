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
ba46210881c7ae6376dc2df583ebf6ac378be324d26b07df34783f678d4c476e  openlist-runsv-4.2.10-beta.20261117-nomount-arm64-v8a.zip
b86ae163605c3918e09d74fc4916ff8c492092cb34c6d39d19e244f6c0694c74  openlist-runsv-4.2.10-beta.20261117-nomount-armeabi-v7a.zip
b789f8bd9f3c48ea8033a4741fd2697e0f56a87fcdbbeab4854bbc0d05fdf57c  openlist-runsv-4.2.10-beta.20261117-nomount-x86_64.zip
d58f81b20cc4f793c2741fe751a09aaca35f74309c290a01098d6eb0b1c59f0a  openlist-runsv-4.2.10-beta.20261117-nomount-x86.zip
0b2f9aa92d34ded7031042edb12798891dadb08b6fd118fee902fd5e4f974093  openlist-runsv-4.2.10-beta.20261117-mount-arm64-v8a.zip
04dbddeee24804f2c20095eb7040e0a6231ff81d862b02e437bb22b96f161fb2  openlist-runsv-4.2.10-beta.20261117-mount-armeabi-v7a.zip
eaeecf7f820cdf5c4d4323ea614eb2dcaa648321634220635e9369fe5b1ac1ec  openlist-runsv-4.2.10-beta.20261117-mount-x86_64.zip
ff99b6560545473aaf49828cd0ff74e8a0152893f7d0dc799b0d96d6394a2cc6  openlist-runsv-4.2.10-beta.20261117-mount-x86.zip
```
