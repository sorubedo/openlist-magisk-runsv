## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | prerelease |
| Module version | 4.2.9-beta.20261024 |
| OpenList upstream | [beta](https://github.com/OpenListTeam/OpenList/releases/tag/beta) |
| Upstream build time | 2026-10-24T15:58:43Z |

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
d8f6b9ac30d47474095d070ffedcedb931d63f0461cc8b0ed089e177ab0e1b0b  openlist-runsv-4.2.9-beta.20261024-nomount-arm64-v8a.zip
c7d98cfd1d4384bb8068d8c7d2f19dab7e99efa5227b9956a756a09f22c3e20e  openlist-runsv-4.2.9-beta.20261024-nomount-armeabi-v7a.zip
f929a0a35c4641bccb794bbb2f2f8d83c003d0e54f19439e12855fb24b09c76b  openlist-runsv-4.2.9-beta.20261024-nomount-x86_64.zip
7f15ae04a69c0dc564ed39250d8f8dca0051d78d5e30ecbbf05e31dfbb5e451f  openlist-runsv-4.2.9-beta.20261024-nomount-x86.zip
5f45f15e5e1301576463ec49e6c883d036a42d7176ab328bc88610383181de02  openlist-runsv-4.2.9-beta.20261024-mount-arm64-v8a.zip
6fde335f53658c9d506ece35f6b733003c950939fe1134da3028968c181fd558  openlist-runsv-4.2.9-beta.20261024-mount-armeabi-v7a.zip
72a8f8b4b56d6088fec2877f43ea16b80d5d99df010ef92e84b3c376440d950f  openlist-runsv-4.2.9-beta.20261024-mount-x86_64.zip
9a3853abae82535b64d4ddefd60b498b62d6d81ad27994990f0c174fdf458a20  openlist-runsv-4.2.9-beta.20261024-mount-x86.zip
```
