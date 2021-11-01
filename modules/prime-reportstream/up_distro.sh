#!/bin/bash

source lib/args.sh

wsl -d $marg0 -u $oarg0 -e bash -c \
' \
cd ~/repos/prime-reportstream/prime-router; \
docker-compose --file "docker-compose.build.yml" up --detach; \
./devenv-infrastructure.sh up; \
'
