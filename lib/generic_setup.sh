#!/bin/bash

source lib/waiting.sh
source lib/args.sh

wsl -d $distro -e bash -c \
' \
echo "root:temp" | chpasswd; \
useradd -m '"$user"'; \
echo "'"$user"' ALL=(ALL:ALL) NOPASSWD: ALL" | tee /etc/sudoers.d/'"$user"'; \
chown -R '"$user"':'"$user"' /home/'"$user"'/; \
'

./lib/gpg_import.sh -d $distro -m $module -u $user
