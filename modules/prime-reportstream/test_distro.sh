#!/bin/bash

source lib/args.sh

wsl -d $distro -u $user -e bash -c \
' \
docker exec -it prime-router_sftp_1 chmod 777 /home/foo/upload; \
cd ~/repos/prime-reportstream/prime-router/; \
./gradlew testSmoke; \
'
