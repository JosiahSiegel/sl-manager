#!/bin/bash

source lib/waiting.sh
source lib/args.sh

wsl -d $distro -e bash -c \
' \
echo "root:temp" | chpasswd; \
useradd -m '"$user"'; \
'
