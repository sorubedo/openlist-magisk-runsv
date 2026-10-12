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
4daa66372030742fca07def273bb6c938c8cca3a1728a1e5d6fe212c7e8bc1e7  openlist-runsv-4.2.7-beta.20261010-nomount-arm64-v8a.zip
1116cb94dd03b7db80c912d6f7dc7934c7c5a18c0ff77a23ef78eac25549b494  openlist-runsv-4.2.7-beta.20261010-nomount-armeabi-v7a.zip
444ad6fbb548b5a4858b138aeeca9376de75e323172f9c408f703f956b6eec1d  openlist-runsv-4.2.7-beta.20261010-nomount-x86_64.zip
7a9aa2800d8d99f189553eaaa67aec2a313d0928a9391c05e1b377e93519fc93  openlist-runsv-4.2.7-beta.20261010-nomount-x86.zip
e770d7d52714f2e4f83794417ed7c0169435a36c0e1124c0474387959345bae3  openlist-runsv-4.2.7-beta.20261010-mount-arm64-v8a.zip
0ffc23952db744cd5364bdb8d702ce9ac4d7ffe5610bf169c2a47c6de791e0ed  openlist-runsv-4.2.7-beta.20261010-mount-armeabi-v7a.zip
2503ef317c8b0cb0a0a6e5311a047c3c44a3a09b219e0e403a3e65d2390a8c22  openlist-runsv-4.2.7-beta.20261010-mount-x86_64.zip
6e74ec3902b1b0d4aee2e37bd0ac48aa762a8c22e2d66a1689f74a76efbcccf2  openlist-runsv-4.2.7-beta.20261010-mount-x86.zip
```
