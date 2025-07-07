#!/usr/bin/env bash

set -euo pipefail

mount --label rootfs /mnt/gentoo

btrfs su cr /mnt/gentoo/@
btrfs su cr /mnt/gentoo/@home
btrfs su cr /mnt/gentoo/@.snapshots
btrfs su cr /mnt/gentoo/@srv
btrfs su cr /mnt/gentoo/@opt
btrfs su cr /mnt/gentoo/@repos
btrfs su cr /mnt/gentoo/@distfiles
btrfs su cr /mnt/gentoo/@binpkgs
btrfs su cr /mnt/gentoo/@ccache
btrfs su cr /mnt/gentoo/@log

echo "Btrfs subvolumes created"
echo "Here is the list"
btrfs su list /mnt/gentoo

echo "Unmounting..."
umount -R /mnt/gentoo

echo "Now you can mount subvolumes on respective dirs."

BTRFS_OPTS=defaults,noatime,autodefrag,ssd,space_cache=v2,compress=zstd:3,discard=async

echo "Mounting root volume"

mount -o $BTRFS_OPTS,subvol=/@ /dev/mapper/root /mnt/gentoo

echo "Making the subvolume directories"

mkdir -p /mnt/gentoo/home
mkdir -p /mnt/gentoo/.snapshots
mkdir -p /mnt/gentoo/var/log
mkdir -p /mnt/gentoo/var/db/repos
mkdir -p /mnt/gentoo/var/cache/{distfiles,binpkgs,ccache}
mkdir -p /mnt/gentoo/srv
mkdir -p /mnt/gentoo/opt
mkdir -p /mnt/gentoo/usr
mkdir -p /mnt/gentoo/efi

ls /mnt/gentoo

mount -o $BTRFS_OPTS,subvol=/@home /dev/mapper/root /mnt/gentoo/home
mount -o $BTRFS_OPTS,subvol=/@.snapshots /dev/mapper/root /mnt/gentoo/.snapshots
mount -o $BTRFS_OPTS,subvol=/@log /dev/mapper/root /mnt/gentoo/var/log
mount -o $BTRFS_OPTS,subvol=/@repos /dev/mapper/root /mnt/gentoo/var/db/repos
mount -o $BTRFS_OPTS,subvol=/@distfiles /dev/mapper/root /mnt/gentoo/var/cache/distfiles
mount -o $BTRFS_OPTS,subvol=/@binpkgs /dev/mapper/root /mnt/gentoo/var/cache/binpkgs
mount -o $BTRFS_OPTS,subvol=/@ccache /dev/mapper/root /mnt/gentoo/var/cache/ccache
mount -o $BTRFS_OPTS,subvol=/@srv /dev/mapper/root /mnt/gentoo/srv
mount -o $BTRFS_OPTS,subvol=/@opt /dev/mapper/root /mnt/gentoo/opt


echo "All volumes mounted"
btrfs su list /mnt/gentoo
lsblk

echo "Mount the ESP"
mount --label ESP /mnt/gentoo/efi
lsblk -o name,partuuid
