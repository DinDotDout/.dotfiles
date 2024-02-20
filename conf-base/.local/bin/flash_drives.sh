#!/bin/sh
# dd bs=4M if=path/to/archlinux-version-x86_64.iso of=/dev/disk/by-id/usb-My_flash_drive conv=fsync oflag=direct status=progress
# List all USB flash drives
ls -l /dev/disk/by-id/usb-*
