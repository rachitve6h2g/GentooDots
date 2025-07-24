#!/usr/bin/env bash

set -euo pipefail

echo "This installs networking tools, a basic editor and other"
echo "stuff for basic usage."

echo "Installing vim text editor."
emerge -v --noreplace app-editors/vim 

echo "Installing iwd for wifi"
emerge -v --noreplace net-wireless/iwd

systemctl enable iwd.service
systemctl enable systemd-networkd.socket

echo "Installing sudo"
emerge -v --noreplace app-admin/sudo