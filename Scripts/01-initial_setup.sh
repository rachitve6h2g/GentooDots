#!/usr/bin/env bash

set -euo pipefail

echo "Installing eselect-repository to make git download the tarballs."
emerge -v --noreplace eselect-repository 

eselect repository disable gentoo
rm -rf /var/db/repos/gentoo
eselect repository enable gentoo
eselect repository enable guru
eselect repository enable lamdness
emaint -a sync

echo "Installing app-portage/eix, gentoolkit, emlop"
emerge -v --noreplace app-portage/eix app-portage/gentoolkit app-portage/emlop

# For installing fetchcommandwrapper
MAKE_CONF="/etc/portage/make.conf"
WRAPPER_PATH="/usr/share/fetchcommandwrapper/make.conf"
WRAPPER_LINE="source ${WRAPPER_PATH}"

# 1. Comment out the line if it exists and is uncommented
if grep -Fxq "$WRAPPER_LINE" "$MAKE_CONF"; then
    echo "Commenting out fetchcommandwrapper line in make.conf..."
    sed -i "s|^${WRAPPER_LINE}|# ${WRAPPER_LINE}|" "$MAKE_CONF"
fi

# 2. Install the package unconditionally
echo "Installing app-portage/fetchcommandwrapper..."
emerge --noreplace app-portage/fetchcommandwrapper

# 3. If the wrapper file exists, ensure the source line is present and uncommented
if [[ -f "$WRAPPER_PATH" ]]; then
    echo "$WRAPPER_PATH found."

    # Uncomment the line if it's commented
    if grep -Fxq "# ${WRAPPER_LINE}" "$MAKE_CONF"; then
        echo "Uncommenting fetchcommandwrapper line in make.conf..."
        sed -i "s|^# ${WRAPPER_LINE}|${WRAPPER_LINE}|" "$MAKE_CONF"
    elif ! grep -Fxq "$WRAPPER_LINE" "$MAKE_CONF"; then
        echo "Adding fetchcommandwrapper line to make.conf..."
        echo "$WRAPPER_LINE" >> "$MAKE_CONF"
    fi
else
    echo "$WRAPPER_PATH not found. Leaving make.conf as-is."
fi


echo "Please select your profile now, using \"eselect profile list\""
echo "and update the environment vars, sourcing the profiles."
echo "\$env-update && source /etc/profile, while in chroot."