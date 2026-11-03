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
f5c22634b2f52295fd042ad159a1e1fde1166fea59ae3eb1f985f7657aa35ece  openlist-runsv-4.2.10-beta.20261030-nomount-arm64-v8a.zip
2325a8d2d068112633113d92c68421de44261c6e51839f6f38e40bb21a99a8fc  openlist-runsv-4.2.10-beta.20261030-nomount-armeabi-v7a.zip
127360e59b9584af73dd7e2b1766ca322cbf5ef7f16e0a48744d329bbf283ffa  openlist-runsv-4.2.10-beta.20261030-nomount-x86_64.zip
cefa836a67755767ff84f4fb84dc36b7ba46bd915ff5702b047dd956321e7936  openlist-runsv-4.2.10-beta.20261030-nomount-x86.zip
d50369a5f0609c69016648962678bc8bed5ee0c758d40c2dce2b2cc2ab75ca1e  openlist-runsv-4.2.10-beta.20261030-mount-arm64-v8a.zip
065acaa803d75e3f589b5baaa4aa8bc46d3203ef555ad75b0681ac31706c14a1  openlist-runsv-4.2.10-beta.20261030-mount-armeabi-v7a.zip
d0274d18a977168e37cbfa2190b00ab8a15157434fc6cf158f98139deed50ab3  openlist-runsv-4.2.10-beta.20261030-mount-x86_64.zip
d888c81cbb2113b5bded83ad7116c92bb70c77bc4eca18c93fce719a5caab8b5  openlist-runsv-4.2.10-beta.20261030-mount-x86.zip
```
