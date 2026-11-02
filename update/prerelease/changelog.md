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
81b38e74b32259fd94762a336029007abeda29aa52cfd78f96db674b7d655d07  openlist-runsv-4.2.10-beta.20261030-nomount-arm64-v8a.zip
064571842f1290c36b23430189789f46e4aa758237ac5c44618f7cce70160fd4  openlist-runsv-4.2.10-beta.20261030-nomount-armeabi-v7a.zip
73607d224dedf52871de02f6e3ac82b76707bf252c10eccd56dcf9a92836d3e2  openlist-runsv-4.2.10-beta.20261030-nomount-x86_64.zip
b11ca1a7593fb042a2825f21628818cc4fe42e111bc6ab93dbc5367cc81fa955  openlist-runsv-4.2.10-beta.20261030-nomount-x86.zip
eea2a398bd706546023262e8f6383800461e89bed658ff1496ab3e3515c3343d  openlist-runsv-4.2.10-beta.20261030-mount-arm64-v8a.zip
84276c649e72db42e2560db20efa3c914d827c62173c903e43f4d196d83666ec  openlist-runsv-4.2.10-beta.20261030-mount-armeabi-v7a.zip
eb198d8254ab83f1a24c1f6105f391e49fd0aa73b4a535a9837ba478d71cc011  openlist-runsv-4.2.10-beta.20261030-mount-x86_64.zip
7cada5f5dab12d192c6a0334bd5605d77b6673986270ecbd4c50af6490a7beed  openlist-runsv-4.2.10-beta.20261030-mount-x86.zip
```
