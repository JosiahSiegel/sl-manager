#!/bin/bash

source lib/args.sh

wsl -d $marg0 -u $oarg0 -e bash -c \
' \
cd ~/repos/prime-reportstream/prime-router/; \
./gradlew testEnd2End; \
'
