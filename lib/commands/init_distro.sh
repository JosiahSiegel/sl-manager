#!/bin/bash

source ./lib/waiting.sh

echo '
################################
#           env init           #
################################
'

echo "(Re)initializing raw distro"
./rwsl destroy -d $1 -m $2 -u $3

./rwsl install -d $1 -m $2 -u $3

echo '
################################
#      docker integration      #
################################
'

echo "Preparing docker desktop...(if installed)"
./rwsl docker -d $1 -m $2 -u $3

echo '
################################
#          env setup           #
################################
'

echo "Preparing env..."
./rwsl setup -d $1 -m $2 -u $3

echo '
################################
#          run tests           #
################################
'

echo "Running test...(if exists)"
./rwsl test -d $1 -m $2 -u $3

echo '
################################
#         enter distro         #
################################
'

echo "Entering distro..."
./rwsl enter -d $1 -m $2 -u $3
