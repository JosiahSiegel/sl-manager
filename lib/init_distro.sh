#!/bin/bash

echo '
################################
#           env init           #
################################
'

echo "(Re)initializing raw distro"
./slm destroy -d $1 -m $2 -u $3

./slm install -d $1 -m $2 -u $3

echo '
################################
#      docker integration      #
################################
'

echo "Preparing docker desktop...(if installed)"
./slm docker -d $1 -m $2 -u $3

echo '
################################
#          env setup           #
################################
'

echo "Preparing env..."
./slm setup -d $1 -m $2 -u $3

echo '
################################
#          run tests           #
################################
'

echo "Running test...(if exists)"
./slm test -d $1 -m $2 -u $3

echo '
################################
#         enter distro         #
################################
'

echo "Entering distro..."
./slm enter -d $1 -m $2 -u $3
