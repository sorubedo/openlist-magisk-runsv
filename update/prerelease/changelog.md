## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | prerelease |
| Module version | 4.2.10-beta.20261025 |
| OpenList upstream | [beta](https://github.com/OpenListTeam/OpenList/releases/tag/beta) |
| Upstream build time | 2026-10-25T16:05:45Z |

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
606691f5bac603b4f1b6bbf9ce88ee9683aee43eca3de382e73ef7b8aaee9f6e  openlist-runsv-4.2.10-beta.20261025-nomount-arm64-v8a.zip
b7b464494dd3d2948f8e8901833d9951d48cd8779ed440d6bc79675e1e8830cd  openlist-runsv-4.2.10-beta.20261025-nomount-armeabi-v7a.zip
f7143aa78bf9f339d512a8e31f597c14a1e4834a2f8159d09fb08ab441a21478  openlist-runsv-4.2.10-beta.20261025-nomount-x86_64.zip
d14d2e807c2cd6c17cc2f55ff89c6529bc4b1a8c469464f4fce67093d9cb1ad6  openlist-runsv-4.2.10-beta.20261025-nomount-x86.zip
dba01c72ac5ad017559a5e56afa4e42c1a7447e93ee37587bd7c19bc6a4aaaf7  openlist-runsv-4.2.10-beta.20261025-mount-arm64-v8a.zip
4218b37a9457a7403f4a75c95c2467a9f536b372731a21e580747b786484a6e1  openlist-runsv-4.2.10-beta.20261025-mount-armeabi-v7a.zip
fbbfbe3fcfedd9cadeaab708dae88f8bd4f7a5abdda38fd2efc897ffca614e62  openlist-runsv-4.2.10-beta.20261025-mount-x86_64.zip
00a18bffc557a146c32a72297e5944b09134c7b0075322a188f9e5d3fb3bd325  openlist-runsv-4.2.10-beta.20261025-mount-x86.zip
```
