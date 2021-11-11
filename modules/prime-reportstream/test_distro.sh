#!/bin/bash

wsl -d $1 -u $3 -e bash -c \
' \
docker exec -it prime-router_sftp_1 chmod 777 /home/foo/upload; \
cd ~/repos/prime-reportstream/prime-router/; \
./gradlew testSmoke; \
'
