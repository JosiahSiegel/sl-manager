#!/bin/bash

source lib/waiting.sh
source lib/args.sh

echo '
################################
#           env init           #
################################
'

echo "(Re)initializing raw distro"
./destroy_distro.sh -m0 $marg0 -m1 $marg1 -o0 $oarg0 &>/dev/null
sleep 5

wsl --install -d $marg0
sleep 15

echo "Creating dev env"
echo ""
echo "***"
echo "CHANGE ROOT PASSWORD FROM 'temp'!"
echo "User '"$oarg0"'"
echo "***"
echo ""
./lib/generic_setup.sh -m0 $marg0 -m1 $marg1 -o0 $oarg0
./modules/$marg1/dev_setup.sh -m0 $marg0 -m1 $marg1 -o0 $oarg0 &>/dev/null &
waiting

echo '
################################
#      docker integration      #
################################
'

echo "Preparing docker desktop...(if installed)"
./lib/fix_docker.sh -m0 $marg0 -m1 $marg1 -o0 $oarg0

echo '
################################
#          test prep           #
################################
'

echo "Preparing test infrastructure...(if exists)"
./modules/$marg1/test_prep.sh -m0 $marg0 -m1 $marg1 -o0 $oarg0 > /dev/null &
waiting

echo '
################################
#          run tests           #
################################
'

echo "Running test...(if exists)"
./modules/$marg1/test.sh -m0 $marg0 -m1 $marg1 -o0 $oarg0
