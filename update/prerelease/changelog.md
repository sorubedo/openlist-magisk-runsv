## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | prerelease |
| Module version | 4.2.7-beta.20261010 |
| OpenList upstream | [beta](https://github.com/OpenListTeam/OpenList/releases/tag/beta) |
| Upstream build time | 2026-10-10T03:54:23Z |

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
55842983fc7e6a20c75f975cd222ff730611a48b6d51e8381812b699033439b8  openlist-runsv-4.2.7-beta.20261010-nomount-arm64-v8a.zip
2e0187769778e3dc46f2b594fbb591e1160d8b3774b09ca89d8f3e448f31d4e9  openlist-runsv-4.2.7-beta.20261010-nomount-armeabi-v7a.zip
50377b25f97518286c8805374e0965d6eb3fa8a81bb984828d1041c286ba8c87  openlist-runsv-4.2.7-beta.20261010-nomount-x86_64.zip
c57381ece55675fd8a0d7124d00f8c73d03f71bd4132643c5339f3f25f7821d6  openlist-runsv-4.2.7-beta.20261010-nomount-x86.zip
c540273a28d07a97df4010a85bc32791454fd21e838e2698d0c7634864c97366  openlist-runsv-4.2.7-beta.20261010-mount-arm64-v8a.zip
d8eb661854d5a96ef5c2081f9af46944c5c16792f9d7c2b960082967c4b5534f  openlist-runsv-4.2.7-beta.20261010-mount-armeabi-v7a.zip
fb172b49f6bcadb77058cb274812acb493c82da0c4c1d5c6abb91dbba5a49700  openlist-runsv-4.2.7-beta.20261010-mount-x86_64.zip
ab9b256eff00a41b3e875a067e277f4126c357e37f54a758a469adc59f26b811  openlist-runsv-4.2.7-beta.20261010-mount-x86.zip
```
