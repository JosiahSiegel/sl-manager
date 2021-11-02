#!/bin/bash

source lib/args.sh

wsl -d $distro -u $user -e bash -c \
' \
cd ~/repos/prime-reportstream/prime-router/; \
./cleanslate.sh --prune-volumes; \
'
