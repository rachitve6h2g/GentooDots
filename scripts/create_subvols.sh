#!/usr/bin/env bash

BTRFS_OPTS=defaults,noatime,ssd,space_cache=v2,compress=zstd,discard=async,autodefrag

DEVICE="/dev/mapper/root"
MOUNTPOINT="/mnt/gentoo"

declare -a subvols=(
	"@"
	"@home"
	"@usr"
	"@srv"
	"@opt"
	"@log"
	"@distfiles"
	"@ccache"
	"@binpkgs"
)

echo "Mounting rootfs on $MOUNTPOINT"

mount "$DEVICE" "$MOUNTPOINT"

echo "Creating subvolumes"

for subvol in "${subvols[@]}"; do
	btrfs su cr "$MOUNTPOINT/$subvol"
done

echo "Done creating the subvols..."
btrfs su list "$MOUNTPOINT"

echo "Unmounting."
umount -R "$MOUNTPOINT"

echo "Now mounting the subvols"

mount -o $BTRFS_OPTS,subvol=/@ $DEVICE $MOUNTPOINT

declare -a mountpoints=(
	["@home"]="/home"
	["@usr"]="/usr"
	["@opt"]="/opt"
	["@srv"]="/srv"
	["@log"]="/var/log"
	["@distfiles"]="/var/cache/distfiles"
	["@binpkgs"]="/var/cache/binpkgs"
	["@ccache"]="/var/cache/ccache"
)

for subvol in "${!mountpoints[@]}"; do
	mkdir -p "$MOUNTPOINT${mountpoints[$subvol]}"
	mount -o $BTRFS_OPTS,subvol=$subvol "$DEVICE" "$MOUNTPOINT${mountpoints[$subvol]}"
done
