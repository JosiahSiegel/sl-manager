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
docker ps --format '{{.Names}}'

echo '
################################
#          application         #
################################
'
./modules/$module/status_distro.sh -d $distro -m $module -u $user
