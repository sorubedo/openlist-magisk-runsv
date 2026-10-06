#!/system/bin/sh
#
# Removing this module deletes the openlist runsv service folder.
# That folder holds the service definition (run/log/finish/down) and, for the
# nomount variant, the data folder ./data and the binary copy.
# The mount variant's data lives outside the module, on shared storage at
# /storage/emulated/0/Android/openlist, and is intentionally left untouched so
# a reinstall finds your file list again. Remove it manually if you want it
# gone. The mount variant's core binary lives in the module's system/bin and is
# removed automatically by the manager.
# Service logs under /data/adb/runsvdir/log/sv/openlist are left untouched.
#
rm -rf /data/adb/runsvdir/service/openlist
