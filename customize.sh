#!/system/bin/sh
#
# openlist (runsv) installer
#
#  * requires runsvdir-magisk (services live in /data/adb/runsvdir/service/)
#  * two variants, picked by which ZIP you flash:
#      nomount : core binary is copied into the service folder (no mount),
#                runs as root:root, data folder is ./data
#      mount   : core binary is shipped in system/bin and mounted by the
#                manager at /system/bin/openlist; runs as the shell user with
#                storage groups, data folder is Android/openlist on /storage
#  * the packaged service/openlist tree is merged over the installed service
#    folder, so run / conf / log/run / the binary / an optional down file all
#    update together; user data (./data, extra files) is never deleted
#

SVDIR=/data/adb/runsvdir/service
SVC="$SVDIR/openlist"
MOUNT_DATA="/storage/emulated/0/Android/openlist"
DEP_URL="https://github.com/sorubedo/runsvdir-magisk"

banner() {
    ui_print "=============================================="
    ui_print "            openlist (runsv)"
    ui_print "=============================================="
}

abort_missing_dep() {
    ui_print ""
    ui_print "############################################################"
    ui_print "#                                                          #"
    ui_print "#   安装中止：缺少依赖 runsvdir-magisk                      #"
    ui_print "#                                                          #"
    ui_print "#   请先安装并重启 runsvdir-magisk，确认以下目录存在：      #"
    ui_print "#     $SVDIR"
    ui_print "#                                                          #"
    ui_print "#   下载地址：                                              #"
    ui_print "#     $DEP_URL"
    ui_print "#                                                          #"
    ui_print "############################################################"
    ui_print ""
    abort "! Installation aborted: runsvdir-magisk is missing or inactive"
}

runsvdir_module_ok() {
    local root
    for root in /data/adb/modules /data/adb/lite_modules; do
        if [ -d "$root/runsvdir" ] \
            && [ ! -e "$root/runsvdir/remove" ] \
            && [ ! -e "$root/runsvdir/disable" ]; then
            return 0
        fi
    done
    return 1
}

# Update choice, picked with the volume keys. Defaults to binary only so that
# software-flashed installs (no getevent / no key press) never hang.
GETEVENT=/system/bin/getevent
[ -x "$GETEVENT" ] || GETEVENT="$(command -v getevent 2>/dev/null)"
UPDATE_MODE=binary

choose_update_mode() {
    if [ -z "$GETEVENT" ]; then
        ui_print "- 未找到 getevent，按默认方式仅更新二进制"
        return 0
    fi

    ui_print ""
    ui_print "=============================================="
    ui_print "  检测到已安装，请选择更新方式"
    ui_print "=============================================="
    ui_print "  音量上 : 仅更新 openlist 二进制"
    ui_print "           （保留你修改过的 run / conf / log/run）"
    ui_print "  音量下 : 完整更新"
    ui_print "           （按安装包的 service 目录覆盖 run / conf / log/run / 二进制）"
    ui_print "  30 秒内未选择则默认仅更新二进制"
    ui_print ""

    i=0
    while [ "$i" -lt 6 ]; do
        ev="$(timeout 5 "$GETEVENT" -lqc 1 2>/dev/null)"
        case "$ev" in
            *KEY_VOLUMEUP*DOWN*)
                UPDATE_MODE=binary
                ui_print "- 已选择：仅更新 openlist 二进制"
                return 0
                ;;
            *KEY_VOLUMEDOWN*DOWN*)
                UPDATE_MODE=full
                ui_print "- 已选择：完整更新"
                return 0
                ;;
        esac
        i=$((i + 1))
    done

    ui_print "- 超时未选择，按默认方式仅更新二进制"
    return 0
}

case "$ARCH" in
    arm64) ABI=arm64-v8a ;;
    arm)   ABI=armeabi-v7a ;;
    x64)   ABI=x86_64 ;;
    x86)   ABI=x86 ;;
    *)
        ui_print "! Unsupported architecture: $ARCH"
        abort "! Aborting installation"
        ;;
esac

# build-info.prop is written by package.sh and carries the channel / variant /
# ABI this package was built for.
MODULE_VARIANT=""
if [ -f "$MODPATH/build-info.prop" ]; then
    MODULE_VARIANT="$(sed -n 's/^moduleVariant=//p' "$MODPATH/build-info.prop" 2>/dev/null | head -n 1)"
fi
case "$MODULE_VARIANT" in
    mount) ;;
    nomount) ;;
    *) MODULE_VARIANT=nomount ;;
esac

if [ "$MODULE_VARIANT" = "mount" ]; then
    BIN_SRC="$MODPATH/system/bin/openlist"
    VARIANT_LABEL="mount"
else
    BIN_SRC="$MODPATH/service/openlist/bin/openlist"
    VARIANT_LABEL="nomount"
fi

# The package only carries one ABI's binary, so check it against the device.
TARGET_ABI="$(sed -n 's/^targetAbi=//p' "$MODPATH/build-info.prop" 2>/dev/null | head -n 1)"
if [ -n "$TARGET_ABI" ] && [ "$TARGET_ABI" != "$ABI" ]; then
    ui_print "! 安装包架构: $TARGET_ABI，本机架构: $ABI"
    abort "! Please download the $ABI build for this device"
fi

if [ ! -f "$BIN_SRC" ]; then
    ui_print "! Wrong package: no $ABI openlist binary for the $MODULE_VARIANT variant"
    abort "! Please download the $ABI $MODULE_VARIANT build for this device"
fi

banner
ui_print "- 设备架构: $ARCH ($ABI)"
ui_print "- 安装方式: $VARIANT_LABEL"

UPDATE_CHANNEL=""
if [ -f "$MODPATH/build-info.prop" ]; then
    UPDATE_CHANNEL="$(sed -n 's/^moduleChannel=//p' "$MODPATH/build-info.prop" 2>/dev/null | head -n 1)"
fi
case "$UPDATE_CHANNEL" in
    stable) UPDATE_CHANNEL_LABEL="稳定版" ;;
    prerelease) UPDATE_CHANNEL_LABEL="预发布版" ;;
    "") UPDATE_CHANNEL_LABEL="" ;;
    *) UPDATE_CHANNEL_LABEL="$UPDATE_CHANNEL" ;;
esac
[ -n "$UPDATE_CHANNEL_LABEL" ] && ui_print "- 更新渠道: $UPDATE_CHANNEL_LABEL"

ui_print "- 检查依赖: runsvdir-magisk"

runsvdir_module_ok || abort_missing_dep
[ -d "$SVDIR" ] || abort_missing_dep

ui_print "- 依赖检查通过"
ui_print ""

UPDATE=0
[ -d "$SVC" ] && UPDATE=1

# Which variant is currently installed? The service folder carries a marker so
# a nomount <-> mount switch can be detected and the run script force-updated.
INSTALLED_VARIANT=""
if [ -f "$SVC/.variant" ]; then
    INSTALLED_VARIANT="$(head -n 1 "$SVC/.variant" 2>/dev/null)"
elif [ -f "$SVC/bin/openlist" ]; then
    INSTALLED_VARIANT="nomount"
fi

VARIANT_CHANGED=0
if [ "$UPDATE" -eq 1 ] && [ -n "$INSTALLED_VARIANT" ] && [ "$INSTALLED_VARIANT" != "$MODULE_VARIANT" ]; then
    VARIANT_CHANGED=1
fi

if [ "$UPDATE" -eq 1 ]; then
    if [ "$VARIANT_CHANGED" -eq 1 ]; then
        UPDATE_MODE=full
        ui_print "- 检测到安装方式变化: $INSTALLED_VARIANT -> $MODULE_VARIANT"
        ui_print "- 将执行完整更新以匹配新的安装方式"
    else
        choose_update_mode
    fi
fi

# --- install / update the service -------------------------------------
# The packaged service/openlist folder is the single source of truth: it is
# merged over the installed service folder, so run / conf / finish / log/run /
# the nomount binary and an optional down file all refresh in one go. The copy
# only writes names that the package ships, so anything that lives only in the
# installed folder (./data, files you dropped in) is left untouched.

# overlay_copy <src_dir> <dst_dir>
# Merge src over dst. Regular files are written under a temp name and renamed
# into place, so a running binary is replaced atomically (no "text file busy")
# and directories are merged rather than replaced.
overlay_copy() {
    local oc_src="$1" oc_dst="$2" oc_entry oc_name oc_tmp
    mkdir -p "$oc_dst" || return 1
    for oc_entry in "$oc_src"/* "$oc_src"/.[!.]* "$oc_src"/..?*; do
        [ -e "$oc_entry" ] || continue
        oc_name="${oc_entry##*/}"
        if [ -d "$oc_entry" ]; then
            overlay_copy "$oc_entry" "$oc_dst/$oc_name" || return 1
        elif [ -f "$oc_entry" ]; then
            oc_tmp="$oc_dst/.$oc_name.install"
            cp -f "$oc_entry" "$oc_tmp" 2>/dev/null || { rm -f "$oc_tmp"; return 1; }
            mv -f "$oc_tmp" "$oc_dst/$oc_name" 2>/dev/null || { rm -f "$oc_tmp"; return 1; }
        fi
    done
    return 0
}

mkdir -p "$SVC"

# The autostart flag (./down) reflects the user's choice, not package data.
# Remember its current state so an update can keep it.
DOWNFILE="$SVC/down"
HAD_DOWN=0
[ "$UPDATE" -eq 1 ] && [ -e "$DOWNFILE" ] && HAD_DOWN=1

# The mount binary is the module's system payload; drop any stale copy left in
# the service folder by an earlier nomount install.
if [ "$MODULE_VARIANT" = "mount" ]; then
    chmod 0755 "$MODPATH/system/bin/openlist" 2>/dev/null
    rm -f "$SVC/bin/openlist"
    rmdir "$SVC/bin" 2>/dev/null
fi

# Remember the variant so a later flash can detect a switch.
printf '%s\n' "$MODULE_VARIANT" > "$SVC/.variant"
chmod 0644 "$SVC/.variant" 2>/dev/null
chown 0:0 "$SVC/.variant" 2>/dev/null

if [ "$UPDATE" -eq 0 ] || [ "$UPDATE_MODE" = "full" ]; then
    # Fresh install or full update: merge the whole packaged service tree.
    overlay_copy "$MODPATH/service/openlist" "$SVC"
elif [ "$MODULE_VARIANT" = "nomount" ]; then
    # Binary-only update: refresh just the nomount binary.
    overlay_copy "$MODPATH/service/openlist/bin" "$SVC/bin"
fi

# A fresh install (or a custom package shipping no down file) starts enabled;
# an update keeps whatever autostart state the user already had.
if [ "$UPDATE" -eq 1 ] && [ "$HAD_DOWN" -eq 0 ]; then
    rm -f "$DOWNFILE"
fi

# Extraction can drop the executable bit, so set the well-known service files
# explicitly. Extra files shipped by a custom package keep their own modes.
chmod 0755 "$SVC/run" "$SVC/finish" "$SVC/log/run" 2>/dev/null
chmod 0644 "$SVC/conf" 2>/dev/null
if [ -f "$SVC/bin/openlist" ]; then chmod 0755 "$SVC/bin/openlist"; fi
chown 0:0 "$SVC/run" "$SVC/conf" "$SVC/finish" "$SVC/log/run" 2>/dev/null

# Keep $MODPATH/system for the mount variant (it is the payload that gets
# mounted); remove the installer-only staging and service trees.
rm -rf "$MODPATH/bin" "$MODPATH/service"

# --- messages ---------------------------------------------------------
if [ "$UPDATE" -eq 1 ]; then
    ui_print "=============================================="
    if [ "$UPDATE_MODE" = "full" ]; then
        ui_print "  更新完成：完整更新"
    else
        ui_print "  更新完成：仅 openlist 二进制"
    fi
    ui_print "=============================================="
    if [ "$UPDATE_MODE" = "full" ]; then
        ui_print "  run / conf / log/run / 二进制 已按安装包更新"
        ui_print "  服务目录里的数据文件未被改动"
    else
        ui_print "  现有 run / log/run / conf 保持不变"
    fi
    ui_print ""
    if [ "$MODULE_VARIANT" = "mount" ]; then
        ui_print "!! 本安装方式下，更新后请重启手机，让新的"
        ui_print "   /system/bin/openlist 挂载生效"
    else
        ui_print "!! 更新后请重启服务以加载新二进制:"
        ui_print "   sv restart $SVC"
    fi
else
    ui_print "=============================================="
    ui_print "  首次安装完成"
    ui_print "=============================================="
    ui_print "  服务目录: $SVC"
    ui_print "  启动脚本: $SVC/run      (按需修改)"
    ui_print "  服务配置: $SVC/conf     (按需修改)"
    if [ "$MODULE_VARIANT" = "mount" ]; then
        ui_print "  核心二进制: /system/bin/openlist (挂载, 重启后生效)"
        ui_print "  数据目录: $MOUNT_DATA"
    else
        ui_print "  核心二进制: $SVC/bin/openlist"
        ui_print "  数据目录: $SVC/data"
    fi
    ui_print "  当前状态: 已停用 (存在 down 文件)"
fi

if [ -n "$UPDATE_CHANNEL_LABEL" ]; then
    ui_print ""
    ui_print "更新渠道: $UPDATE_CHANNEL_LABEL"
    ui_print "  可在操作按钮菜单里切换 稳定版 / 预发布版"
fi

ui_print ""
ui_print "----------------------------------------------------"
ui_print "  常用命令"
ui_print "----------------------------------------------------"
ui_print "  启用开机自启: rm $SVC/down"
ui_print "  停用开机自启: touch $SVC/down"
ui_print "  启动服务:     sv up $SVC"
ui_print "  停止服务:     sv down $SVC"
ui_print "  重启服务:     sv restart $SVC"
ui_print "  查看状态:     sv status $SVC"
ui_print "  启动并启用:   SVDIR=$SVDIR sv-enable openlist"
ui_print "  停止并停用:   SVDIR=$SVDIR sv-disable openlist"
ui_print "  查看日志:     tail -f /data/adb/runsvdir/log/sv/openlist/current"
ui_print "----------------------------------------------------"
if [ "$MODULE_VARIANT" = "mount" ]; then
    ui_print "- 注意: 修改数据目录后可用 sv restart 生效；但更新模块后需重启手机"
else
    ui_print "- 放置配置后，执行上方的启动命令或使用模块操作按钮"
fi
