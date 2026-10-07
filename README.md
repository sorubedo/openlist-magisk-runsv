# openlist-runsv

[English](README.md) | [中文](README_zh-CN.md)

Run [OpenList](https://github.com/OpenListTeam/OpenList) as an autostart runsv service on Magisk / KernelSU / APatch.

The version follows the official OpenList version. There are two release channels, **Release** (stable) and **Pre-release** (test), and each channel is published in two variants, **nomount** and **mount**.

## Variants: nomount vs mount

| | `nomount` | `mount` |
| --- | --- | --- |
| Core binary | `.../service/openlist/bin/openlist` (service folder) | module `system/bin/openlist`, mounted at `/system/bin/openlist` |
| Mounts anything? | no | yes, ships the core into `/system/bin` |
| Runs as | `root`, no privilege drop | `shell` with the storage groups |
| Data folder | `./data` (inside the service folder) | `/storage/emulated/0/Android/openlist` |
| Waits for storage decryption | no | yes |
| Apply a new core | `sv restart` reloads it | reboot (the new mount only appears after a reboot) |

The reason for the two variants: `/data/adb` is not readable by normal users, so a `nomount` core can only run as root and keeps its data next to itself. The `mount` variant puts the core on `/system/bin` (world-readable/executable), drops to the shell user with the storage groups, and keeps its data on shared storage.

Both variants share the same module id, so flashing the other variant over the installed one switches it in place.

The user-editable settings (`RUN_AS`, `OPENLIST_DATA`, `WAIT_DECRYPT`) live in `conf` next to `run`, and `run` loads it.

## Install

1. Install [runsvdir-magisk](https://github.com/sorubedo/runsvdir-magisk) first, then reboot.
2. Flash this module. Pick the ABI for your device (`arm64-v8a` for most phones) and the variant you want (`nomount` or `mount`), then reboot.

> Without runsvdir-magisk the installer stops and tells you what is missing.

## Start

Nothing starts by itself on a fresh install. Tap the module **action** button (Volume Down to move, Volume Up to run) and pick "start + enable". Or use the shell:

```sh
SVC=/data/adb/runsvdir/service/openlist

SVDIR=/data/adb/runsvdir/service sv-enable openlist   # start + autostart
SVDIR=/data/adb/runsvdir/service sv-disable openlist  # stop + no autostart
sv up $SVC        # start this time
sv down $SVC      # stop this time
sv restart $SVC   # restart the service
sv status $SVC    # status
tail -f /data/adb/runsvdir/log/sv/openlist/current    # logs
```

## Update

Flash the newer package over the old one; your data and autostart setting are kept. If you edited `run` / `conf` / `log/run`, the installer asks with the volume keys: Volume Up updates the binary only, Volume Down does a full update (merges the package's `service/openlist` tree over the service folder, refreshing `run` / `conf` / `log/run` / the binary). Files that only exist in the service folder are never deleted.

- `nomount`: restart the service afterwards — `sv restart /data/adb/runsvdir/service/openlist`.
- `mount`: **reboot** afterwards; the new core is mounted from `/system/bin` only after a reboot.

The manager can also check for updates by itself; switch between the **stable** and **prerelease** channel (and keep the current variant) from the module action menu.

## Uninstall

This removes the whole service folder. For `nomount` that includes `./data`; back it up first. The `mount` variant's data folder on `/storage/emulated/0` is left untouched, so a reinstall finds your file list again.

## FAQ

- **Installer says runsvdir-magisk is missing**: install runsvdir-magisk, reboot, then flash this module.
- **Service is not running**: check the log, then `sv status $SVC`.
- **Cannot reach the web UI**: OpenList listens on `0.0.0.0:5244` by default; the log prints the address and the initial admin password.
- **Forgot the admin password**: use "reset password" in the module action menu; it prints the new one.
- **Want another data folder**: edit `OPENLIST_DATA` in the service's `conf`, then restart the service.
