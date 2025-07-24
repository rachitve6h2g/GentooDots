#!/usr/bin/env bash
set -e

for script in 0[0-5]-*.sh; do
  echo "Running $script..."
  bash "$script"
done

echo "Base system installation complete. Now reboot and run 99-post-boot-packages.sh manually."
