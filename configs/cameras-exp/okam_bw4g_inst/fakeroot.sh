#!/bin/sh
# runs under fakeroot before rootfs packing: fix exec bits
chmod 755 ${TARGET_DIR}/init ${TARGET_DIR}/linuxrc 2>/dev/null || true
# make sure /dev/console and /dev/null exist for early kernel use
[ -c ${TARGET_DIR}/dev/console ] || mknod -m 600 ${TARGET_DIR}/dev/console c 5 1
[ -c ${TARGET_DIR}/dev/null ]    || mknod -m 666 ${TARGET_DIR}/dev/null    c 1 3
