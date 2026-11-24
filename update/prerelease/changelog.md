## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | prerelease |
| Module version | 4.2.11-beta.20261124 |
| OpenList upstream | [beta](https://github.com/OpenListTeam/OpenList/releases/tag/beta) |
| Upstream build time | 2026-11-24T04:16:40Z |

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
9ad32baa9484012dd9f6dc17614f7c7fbabb24a8c824f0fe08eb6eb36aea3e71  openlist-runsv-4.2.11-beta.20261124-nomount-arm64-v8a.zip
4fa6d573f239a5f6d607bac85b128bf9f29d51a746afb5b3ff5e4e424a6a60a0  openlist-runsv-4.2.11-beta.20261124-nomount-armeabi-v7a.zip
038d6ce60026e6901671f63b62815e4544b56694117f0a36c612dc01abb94051  openlist-runsv-4.2.11-beta.20261124-nomount-x86_64.zip
71a57b7f7183a83b53c889eb89f3bcee8f985b57e9870c3e2ba44fb133c34733  openlist-runsv-4.2.11-beta.20261124-nomount-x86.zip
675ee976b2b4f010f197bdc741ea18a405d9f2c8f41b073e202cc64b8dc1c917  openlist-runsv-4.2.11-beta.20261124-mount-arm64-v8a.zip
a126d01cdb9925cbb7711a1be697dd6a004ec67d3d1b3b67124a500c2e681470  openlist-runsv-4.2.11-beta.20261124-mount-armeabi-v7a.zip
9f203a3e60537e3d4a3456f709af2ba90e8d03f8b7a0436fcf79154f1844428f  openlist-runsv-4.2.11-beta.20261124-mount-x86_64.zip
ed51a1fe71a540429967968b0d423e738d0d35c940c3ee74e4c131f1d2690290  openlist-runsv-4.2.11-beta.20261124-mount-x86.zip
```
