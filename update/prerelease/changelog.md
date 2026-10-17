## Build information

| Component | Value |
| --- | --- |
| Module | openlist-runsv |
| Channel | prerelease |
| Module version | 4.2.7-beta.20261015 |
| OpenList upstream | [beta](https://github.com/OpenListTeam/OpenList/releases/tag/beta) |
| Upstream build time | 2026-10-15T14:18:40Z |

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
292aabfcc04b09b457ab4dbb76019eca2d8b432b7e66871f286dfdab4c95231a  openlist-runsv-4.2.7-beta.20261015-nomount-arm64-v8a.zip
fe9916b4e788734cdcb29d91a818c238374ac4fb09298e9717ca662f33106b51  openlist-runsv-4.2.7-beta.20261015-nomount-armeabi-v7a.zip
6a09cb6ebf28ecfe7efe67b3ba12008f2d4eff2b3f575917965dddc60f5b0de2  openlist-runsv-4.2.7-beta.20261015-nomount-x86_64.zip
6cfa89c317f80a57c11a20a79b99f145f30333c200d342afe096ae6304f5134e  openlist-runsv-4.2.7-beta.20261015-nomount-x86.zip
03bbba79547ba5092fdbb28043aef372c4aaa6571135e48b2d00d2afadd3ec7d  openlist-runsv-4.2.7-beta.20261015-mount-arm64-v8a.zip
abd1140f0ee62bd472eccb023eb56166df58fb1232aeeae50fbc54a273d9dfa5  openlist-runsv-4.2.7-beta.20261015-mount-armeabi-v7a.zip
02641610a4cce213799e67bce939970243aa9bd9e2d2385db960abad857cc57f  openlist-runsv-4.2.7-beta.20261015-mount-x86_64.zip
037b19504fbfe859f87fd156c1979db7caefe6699b00bc0beb73feec2d566902  openlist-runsv-4.2.7-beta.20261015-mount-x86.zip
```
