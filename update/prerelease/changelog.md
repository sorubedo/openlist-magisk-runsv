## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | prerelease |
| Module version | 4.2.8-beta.20261021 |
| OpenList upstream | [beta](https://github.com/OpenListTeam/OpenList/releases/tag/beta) |
| Upstream build time | 2026-10-21T16:49:56Z |

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
c5fc4f02835ce7ec9dacec90faea11c18f7f34aa157fb4e3173967b28062575c  openlist-runsv-4.2.8-beta.20261021-nomount-arm64-v8a.zip
48f852132e5a5ae39dcfaca6205b195c0ef10c5792511775e1db99b8a6539083  openlist-runsv-4.2.8-beta.20261021-nomount-armeabi-v7a.zip
dfce6b0be72b94d10a1fc59f289c3d4fdaaa449cb14e5b5262560b65dd4ee52c  openlist-runsv-4.2.8-beta.20261021-nomount-x86_64.zip
980e8279986bcf5999ba5945d0f73d8952e7cf9832a67da39e4ef0c03ebd3c65  openlist-runsv-4.2.8-beta.20261021-nomount-x86.zip
16d98fc6cc58633e01e7e9897b386eab14075eb04f784038652406de5497ac91  openlist-runsv-4.2.8-beta.20261021-mount-arm64-v8a.zip
06cfceaaba67745e74b031a7970bbfca6e210c8f8e0d7b6a98367428ea6240a4  openlist-runsv-4.2.8-beta.20261021-mount-armeabi-v7a.zip
99cde8f2675d885b3ca8a5b11d98762dd638e36f26dd2857d9a183e3ed088583  openlist-runsv-4.2.8-beta.20261021-mount-x86_64.zip
da7d33709a36957d394bf97441cca3d87d016bfde42dcbd8f7f8a15debb4b731  openlist-runsv-4.2.8-beta.20261021-mount-x86.zip
```
