#!/bin/sh
# In cron
# * * * * * $HOME/bin/sway-cron.sh /bin/notify-send 'hello'
 
set -eu
 
uid="$(id -u)"
 
for sock in /run/user/"${uid}"/sway-ipc.*.*.sock
do
    [ -S "${sock}" ] || continue
    swaymsg -s "${sock}" exec -- "$@"
done
