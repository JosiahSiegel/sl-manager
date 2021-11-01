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
./modules/$marg1/status_distro.sh -m0 $marg0 -m1 $marg1 -o0 $oarg0
