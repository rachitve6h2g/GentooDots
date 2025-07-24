#!/bin/bash
set -euo pipefail

# Stage3 URL (HTTPS, India mirror)
STAGE3_URL="https://mirrors.nxtgen.com/gentoo-mirror/gentoo-source/releases/amd64/autobuilds/current-stage3-amd64-hardened-systemd/stage3-amd64-hardened-systemd-20250720T165240Z.tar.xz"

# Destination directory
DEST_DIR="/mnt/gentoo"
TARBALL="${STAGE3_URL##*/}"

# Make sure target directory exists
mkdir -p "$DEST_DIR"

# Change to target directory
cd "$DEST_DIR"

# Download the tarball (skip if already downloaded)
if [[ ! -f "$TARBALL" ]]; then
    echo "Downloading stage3 tarball..."
    wget "$STAGE3_URL"
else
    echo "Tarball already downloaded: $TARBALL"
fi

# Extract the tarball
echo "Extracting stage3 into $DEST_DIR..."
tar xpvf "$TARBALL" --xattrs-include='*.*' --numeric-owner -C "$DEST_DIR"

echo "Stage3 unpacked successfully."
