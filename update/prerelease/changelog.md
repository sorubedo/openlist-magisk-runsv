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
262b8b948b9facade791a9998ca6838c74a3e92569874a1f4bae15b7234e91dd  openlist-runsv-4.2.10-beta.20261108-nomount-arm64-v8a.zip
f5b333146ad3e97b81593782d6525db50ef2d8c5b97cf23ae9ddfb54fb034257  openlist-runsv-4.2.10-beta.20261108-nomount-armeabi-v7a.zip
7cc2fcc15ffb6c060ea1db8ff35e7491957b2e6e02b8de42f6f5b33c25e88d1a  openlist-runsv-4.2.10-beta.20261108-nomount-x86_64.zip
48cffb0f496835b6204b86015d55a69dfb334e92edcf489f2caeb46fb808dd12  openlist-runsv-4.2.10-beta.20261108-nomount-x86.zip
f3900f8dd927bd493f5ad302f95ac975640fc9e913b0305eb73fc228022a9bcb  openlist-runsv-4.2.10-beta.20261108-mount-arm64-v8a.zip
5cbda0b7746d08dae6fcbde66f02a96970324e022570089ca9919e626ca14175  openlist-runsv-4.2.10-beta.20261108-mount-armeabi-v7a.zip
0057910be9fddbc96ebf9092d0925b174c5c01cd0390cba5c8e217493b02f60d  openlist-runsv-4.2.10-beta.20261108-mount-x86_64.zip
59b82278ee8ffb14b614b4d13336c01415fba8828f2bfce8ce926e4be34e08b7  openlist-runsv-4.2.10-beta.20261108-mount-x86.zip
```
