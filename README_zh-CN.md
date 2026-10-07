# openlist-runsv

[English](README.md) | [中文](README_zh-CN.md)

把 [OpenList](https://github.com/OpenListTeam/OpenList) 做成开机自启的 runsv 服务，适用于 Magisk / KernelSU / APatch。

版本号跟随 OpenList 官方。有 **Release**（稳定版）和 **Pre-release**（测试版）两个发布渠道，每个渠道又分 **nomount** 和 **mount** 两种安装方式。

## 两种安装方式：nomount 与 mount

| | `nomount` | `mount` |
| --- | --- | --- |
| 核心位置 | 服务目录 `.../service/openlist/bin/openlist` | 模块内置 `system/bin/openlist`，挂载到 `/system/bin/openlist` |
| 是否挂载 | 不挂载任何东西 | 把核心挂进 `/system/bin` |
| 运行身份 | `root`，不降权 | `shell` + 存储组 |
| 数据目录 | `./data`（服务目录内） | `/storage/emulated/0/Android/openlist` |
| 是否等待存储解密 | 不等待 | 等待 |
| 更新后如何生效 | `sv restart` 重新加载 | **重启手机**（重启后新挂载才生效） |

分成两种方式的原因：`/data/adb` 普通用户无权访问，所以 nomount 的核心只能以 root 运行，数据也就放在自己旁边。mount 方式把核心放到 `/system/bin`（普通用户可读可执行），降权到 shell 用户并带上存储组，数据放在共享存储上。

两种方式共用一个模块 id，直接刷入另一种即可原地切换安装方式。

用户可改的配置（`RUN_AS`、`OPENLIST_DATA`、`WAIT_DECRYPT`）放在 `run` 旁边的 `conf` 里，由 `run` 加载。

## 安装

1. 先安装 [runsvdir-magisk](https://github.com/sorubedo/runsvdir-magisk) 并重启手机。
2. 刷入本模块。选择设备架构（多数手机选 `arm64-v8a`）和想要的安装方式（`nomount` 或 `mount`），然后重启手机。

> 缺少 runsvdir-magisk 时，本模块会中止安装并提示。

## 启动

首次安装不会自动启动。推荐用模块的「操作」按钮（音量下切换，音量上执行），选「启动并启用」。也可以直接用命令：

```sh
SVC=/data/adb/runsvdir/service/openlist

SVDIR=/data/adb/runsvdir/service sv-enable openlist   # 启动并开机自启
SVDIR=/data/adb/runsvdir/service sv-disable openlist  # 停止并取消自启
sv up $SVC        # 本次启动
sv down $SVC      # 本次停止
sv restart $SVC   # 重启服务
sv status $SVC    # 查看状态
tail -f /data/adb/runsvdir/log/sv/openlist/current    # 查看日志
```

## 更新

覆盖刷入即可，数据和自启设置保留。如果你改过 `run` / `conf` / `log/run`，安装时会用音量键询问：音量上只更新二进制，音量下执行完整更新（用安装包里的 `service/openlist` 目录覆盖服务目录，同步 run / conf / log/run / 二进制）。只存在于服务目录里的文件不会被删除。

- `nomount`：更新后重启服务即可 —— `sv restart /data/adb/runsvdir/service/openlist`。
- `mount`：更新后请**重启手机**，新的核心在重启后才会从 `/system/bin` 挂载生效。

管理器也能自己检测更新；在模块操作菜单里可切换 **稳定版 / 预发布版** 渠道（保持当前安装方式不变）。

## 卸载

卸载会删除整个服务目录；对 `nomount` 来说也包括 `./data`，注意提前备份。`mount` 方式的数据在 `/storage/emulated/0` 上，卸载时不会删除，重装后依然可用。

## 常见问题

- **安装提示缺少 runsvdir-magisk**：先安装 runsvdir-magisk 并重启，再刷本模块。
- **服务没起来**：先看日志，再执行 `sv status $SVC`。
- **打不开网页界面**：OpenList 默认监听 `0.0.0.0:5244`，日志里会打印地址和初始密码。
- **忘了管理员密码**：用模块操作菜单里的「随机重置密码」，会把新密码打印出来。
- **想换数据目录**：编辑服务目录 `conf` 里的 `OPENLIST_DATA`，然后重启服务。
