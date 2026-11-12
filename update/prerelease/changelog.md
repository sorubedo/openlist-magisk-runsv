## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | prerelease |
| Module version | 4.2.10-beta.20261108 |
| OpenList upstream | [beta](https://github.com/OpenListTeam/OpenList/releases/tag/beta) |
| Upstream build time | 2026-11-08T05:22:06Z |

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
4d17500d8c44a37270f3c58c0c87984dc75a8205be53e5009a217dfd30fda181  openlist-runsv-4.2.10-beta.20261108-nomount-arm64-v8a.zip
bc2c14564fb9b431892001db37f85ac9b6e3866ba678cdaac3b1ab2d61b18c9a  openlist-runsv-4.2.10-beta.20261108-nomount-armeabi-v7a.zip
27569e9cd2dd60bcae36b2e4fc4e87f1adf076ad0a7b04460847d6794aeff3a5  openlist-runsv-4.2.10-beta.20261108-nomount-x86_64.zip
c3e22af4ab3e4d694f6a95caf5f2db953099eb84cae67176465df9668a59655d  openlist-runsv-4.2.10-beta.20261108-nomount-x86.zip
3f89c410ddcbd34fd0fe79d45758a3d8b8bae970dd4c5fea6510856850f9d169  openlist-runsv-4.2.10-beta.20261108-mount-arm64-v8a.zip
0548757e6b18f84bb82b233183cdbbf3423ef398d6ecc1dfeedb4bb458be5f68  openlist-runsv-4.2.10-beta.20261108-mount-armeabi-v7a.zip
ee1928548aa38936a3a88fc48a4af2defd67694798ee88a7b9872db2afd32d87  openlist-runsv-4.2.10-beta.20261108-mount-x86_64.zip
9481baff866d7ae14016fce3015eda1128526bd9ff17baebf59f29e61299c094  openlist-runsv-4.2.10-beta.20261108-mount-x86.zip
```
