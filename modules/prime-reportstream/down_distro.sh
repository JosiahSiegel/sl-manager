#!/bin/bash

source lib/args.sh

wsl -d $marg0 -u $oarg0 -e bash -c \
' \
cd ~/repos/prime-reportstream/prime-router/; \
./devenv-infrastructure.sh down; \
docker-compose down --remove-orphans; \
'

docker stop $(docker ps -a --format "{{.ID}} {{.Names}}" | grep prime-router.*)
docker rm -f $(docker ps -a --format "{{.ID}} {{.Names}}" | grep prime-router.*)
