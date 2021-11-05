#!/bin/bash

source lib/waiting.sh
source lib/args.sh

echo '
################################
#           env init           #
################################
'

echo "(Re)initializing raw distro"
./destroy_distro.sh -d $distro -m $module -u $user &>/dev/null
sleep 5

wsl --install -d $distro
sleep 15

echo "Creating dev env"
echo ""
echo "***"
echo "CHANGE ROOT PASSWORD FROM 'temp'!"
echo "User '"$user"'"
echo "***"
echo ""
./lib/generic_setup.sh -d $distro -m $module -u $user
./modules/$module/dev_setup.sh -d $distro -m $module -u $user &>/dev/null &
waiting

echo '
################################
#      docker integration      #
################################
'

echo "Preparing docker desktop...(if installed)"
./lib/fix_docker.sh -d $distro -m $module -u $user

echo '
################################
#          test prep           #
################################
'

echo "Preparing test infrastructure...(if exists)"
./modules/$module/test_prep.sh -d $distro -m $module -u $user &> /dev/null &
waiting

echo '
################################
#          run tests           #
################################
'

echo "Running test...(if exists)"
./test_distro.sh -d $distro -m $module -u $user
