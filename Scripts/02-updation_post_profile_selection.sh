#!/usr/bin/env bash

set -euo pipefail

echo "This happens after profile selection."
echo "It'll take 5s to start, if profile's not been selected,"
echo "Please cancel it and select the profile first."
sleep 5s

echo "Now updating the toolchain."
emerge -1v --update --changed-use --deep gcc binutils glibc

echo "Now updating world set"
emerge -v --update --changed-use --deep @world

echo "Checking for uneeded packages"
emerge -a --depclean

echo "Rebuilding broken links if any..."
revdep-rebuild