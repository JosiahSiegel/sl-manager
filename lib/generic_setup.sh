#!/bin/bash

source lib/waiting.sh
source lib/args.sh

wsl -d $marg0 -e bash -c \
' \
echo "root:temp" | chpasswd; \
useradd -m '"$oarg0"'; \
'
