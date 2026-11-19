## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | stable |
| Module version | 4.2.10 |
| OpenList upstream | [v4.2.10](https://github.com/OpenListTeam/OpenList/releases/tag/v4.2.10) |
| Upstream build time | 2026-11-17T12:24:15Z |

The module version and versionCode are derived from the upstream OpenList release.

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
322cfcf4fb27c2282a8b8baaabde09cddb5ac7bade25e95b4e40c3ba82eddb3a  openlist-runsv-4.2.10-nomount-arm64-v8a.zip
6c8c74b4e1bacd02c698d25db58e393378d27d9b00aaf7a5987e68069fb9373e  openlist-runsv-4.2.10-nomount-armeabi-v7a.zip
8c6d90f0a8ee27b9cfe103939c4334d12c9f52ff82181eec0b0648884ab4715b  openlist-runsv-4.2.10-nomount-x86_64.zip
e674bfb060f0a1b4f2c5a0f32284777baadf5131c70ef0b41910d2e4b213c58a  openlist-runsv-4.2.10-nomount-x86.zip
a18ac76a0ef921c5574a47cf0c55b461b6160a0a57c76becc2605fa1f07e2212  openlist-runsv-4.2.10-mount-arm64-v8a.zip
82aefb49998d0b04dec0c7726f438091363778e13a928d7eeb5f6ce8a3c80df4  openlist-runsv-4.2.10-mount-armeabi-v7a.zip
6110bae5550048968ee23cdfd5ca98fb19f1ebf042754874c2e50da3329953ab  openlist-runsv-4.2.10-mount-x86_64.zip
259b302169c5c0e37999cece3421620b191e78f1fba94c5af1904f5621a3e851  openlist-runsv-4.2.10-mount-x86.zip
```
