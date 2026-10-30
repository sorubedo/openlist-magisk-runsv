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
6d4efef766cb9459ffb72553dcb8699b5ab52d78c961322c3557fba6abf56f84  openlist-runsv-4.2.10-beta.20261030-nomount-arm64-v8a.zip
b75867d239ab45b49f28d3ed7b82ec307b47c30c95221a61beca0dce9888e7ec  openlist-runsv-4.2.10-beta.20261030-nomount-armeabi-v7a.zip
4e62c24042de08aa07c74661591aebe2ad5c335be15b78be1b9f4a13bba674b4  openlist-runsv-4.2.10-beta.20261030-nomount-x86_64.zip
7e31287197e509fab9958f2ae88405d8e78a12fc4a9ba49d3e3ff7c23f0bd655  openlist-runsv-4.2.10-beta.20261030-nomount-x86.zip
7fa6125b786a955a82107b69f35f30120c9fad43b8a48a813a7b190285e003a2  openlist-runsv-4.2.10-beta.20261030-mount-arm64-v8a.zip
7fa13319faaeedd1e7996ec55cc962a50fb378d8c601d623b85c586f9631f4fe  openlist-runsv-4.2.10-beta.20261030-mount-armeabi-v7a.zip
a9aa45c99d36316848c25ee318a4f34370906251853b1d6a7e0646c8313d4fde  openlist-runsv-4.2.10-beta.20261030-mount-x86_64.zip
095e0b77db940941bd59cb0ab992cf5c809a7b901cbb6e081d5fe616b0429d64  openlist-runsv-4.2.10-beta.20261030-mount-x86.zip
```
