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
5c62c10de02dcc1f034c8a3817653cd7f3c6388268c4f23ee143f6b44f8dbb26  openlist-runsv-4.2.10-beta.20261108-nomount-arm64-v8a.zip
001ba9780610b0a47e8b14c32963440073e6bac7fa90be46658e15ee33c37c54  openlist-runsv-4.2.10-beta.20261108-nomount-armeabi-v7a.zip
d80f859f404123f2332e8751985e7daeda0f70054b84b325ec33dacb68ead9e6  openlist-runsv-4.2.10-beta.20261108-nomount-x86_64.zip
08b73101a25fe844ef8d1a509fd39daf4e7c41d9feff90af9aa301c46276a438  openlist-runsv-4.2.10-beta.20261108-nomount-x86.zip
6a2ce18ca8df0ae8c3fa9f8fd868bcbf5ebc3d73daae881df09aec1f3a440fa7  openlist-runsv-4.2.10-beta.20261108-mount-arm64-v8a.zip
1425bbc46bf1e9e9655d082ebf2d018c36b39c6bb1306ab4c0e2ceec7499380c  openlist-runsv-4.2.10-beta.20261108-mount-armeabi-v7a.zip
88a0d533d5cccdecd95b65065c4317087330369a3e89f727e1095bdd69f468cf  openlist-runsv-4.2.10-beta.20261108-mount-x86_64.zip
be96c5724946eb61c17eb05f777d1904b21c66595e3afa8f208605da4a6969b5  openlist-runsv-4.2.10-beta.20261108-mount-x86.zip
```
