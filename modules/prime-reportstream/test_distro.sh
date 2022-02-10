#!/bin/bash

wsl -d $1 -u $3 -e bash -c \
' \
cd ~/repos/prime-reportstream/prime-router/; \
docker-compose -f docker-compose.postgres.yml up -d; \
./gradlew package -Pshowtests; \
./gradlew reloadTables; \
./gradlew reloadSettings; \
./gradlew testIntegration -Pshowtests; \
docker-compose exec -T sftp chmod 777 /home/foo/upload; \
export $(xargs < .vault/env/.env.local); \
./prime create-credential --type=UserPass --persist=DEFAULT-SFTP --user foo --pass pass; \
./gradlew testSmoke; \
'
