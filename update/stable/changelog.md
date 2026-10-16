## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | stable |
| Module version | 4.2.7 |
| OpenList upstream | [v4.2.7](https://github.com/OpenListTeam/OpenList/releases/tag/v4.2.7) |
| Upstream build time | 2026-10-15T14:18:40Z |

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
fff82881fd8479a23221de06cb04b6112e79f51b993dba2fc461fb7c10dd96ec  openlist-runsv-4.2.7-nomount-arm64-v8a.zip
6deac2364003d1c36a76b4ee047215e3ef94c8936985f7a503e6d3f4632d7225  openlist-runsv-4.2.7-nomount-armeabi-v7a.zip
530e257955fc5ad4fb678c2885628d3bac6f398b0595a74bf8244568b489cdc5  openlist-runsv-4.2.7-nomount-x86_64.zip
4d3d7e309ad723fd76fdd3941072b996849e00913c3116329e57788ee92f2b59  openlist-runsv-4.2.7-nomount-x86.zip
05268d4490c3e464e7329408e9a13658762a722025efd104ae77dfe760c6e853  openlist-runsv-4.2.7-mount-arm64-v8a.zip
1c701ce8d90bd6e55229fa7798027d3540e962ff04a1e27ae6d229fe338fa6a1  openlist-runsv-4.2.7-mount-armeabi-v7a.zip
aca61a79d03ba0f8cd22559400fbab3ba59130a01cb8e82ccaa1869595d21a57  openlist-runsv-4.2.7-mount-x86_64.zip
9539042fa37e337e13d4ccd5e3c97c6bcf530969ed55c9857b9281b9ebb9bc05  openlist-runsv-4.2.7-mount-x86.zip
```
