#!/bin/bash

source lib/args.sh

wsl -d $distro -u $user -e bash -c \
' \
cd ~/repos/prime-reportstream/prime-router; \
docker-compose --file "docker-compose.build.yml" up --detach; \
./devenv-infrastructure.sh up; \
'
