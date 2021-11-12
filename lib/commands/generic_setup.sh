#!/bin/bash

wsl -d $1 -e bash -c \
' \
echo "root:temp" | chpasswd; \
useradd -m '"$3"'; \
echo "'"$3"' ALL=(ALL:ALL) NOPASSWD: ALL" | tee /etc/sudoers.d/'"$3"'; \
chown -R '"$3"':'"$3"' /home/'"$3"'/; \
'

./lib/commands/gpg_import.sh $1 $2 $3
