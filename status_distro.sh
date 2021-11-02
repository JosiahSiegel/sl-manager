#!/bin/bash

source lib/args.sh

echo '
################################
#           distros            #
################################
'
wsl -l --all

echo '
################################
#            images            #
################################
'
docker images

echo '
################################
#          containers          #
################################
'
docker ps -q | xargs -i sh -c '\
echo "========================================================="; \
echo "========================================================="; \
docker ps --filter "id={}" --format "{{.Names}}"; \
docker logs --tail 8 {};'

echo '
################################
#          application         #
################################
'
./modules/$module/status_distro.sh -d $distro -m $module -u $user
