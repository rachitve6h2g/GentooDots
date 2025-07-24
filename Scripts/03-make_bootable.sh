#!/usr/bin/env bash

set -euo pipefail

echo "Installing virt-firmware and enabling kernel-bootcfg-boot-successful.service"
emerge -v1 --noreplace app-emulation/virt-firmware

systemctl enable --now kernel-bootcfg-boot-successful.service

echo "Now installing ugrd. Post-installation please edit /etc/ugrd/config.toml"
emerge -v1 --noreplace sys-kernel/ugrd