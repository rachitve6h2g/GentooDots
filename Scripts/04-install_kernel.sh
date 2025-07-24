#!/usr/bin/env bash

set -euo pipefail

echo "installing firmware, microcode and important firmware."
emerge -v --noreplace sys-kernel/gentoo-kernel sys-kernel/linux-firmware sys-firmware/intel-microcode

echo "installing sof-firmware for sound"
emerge -v --noreplace sof-firmware

echo "system is now bootable...(i guess)"