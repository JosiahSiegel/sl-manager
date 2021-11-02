#!/bin/bash

source lib/args.sh

wsl -d $distro -u $user -e bash -c \
' \
gradle --version; \
docker --version; \
git --version; \
java --version; \
psql --version; \
az --version; \
docker-compose --version; \
mkdir -p ~/repos/; \
cd ~/repos/; \
git clone https://github.com/CDCgov/prime-reportstream.git; \
cd prime-reportstream/prime-router/; \
./cleanslate.sh; \
export $(xargs < .vault/env/.env.local); \
docker-compose --file "docker-compose.build.yml" up --detach; \
./devenv-infrastructure.sh; \
./prime create-credential --type=UserPass \
        --persist=DEFAULT-SFTP \
        --user foo \
        --pass pass; \
./prime multiple-settings \
        set --input settings/organizations.yml; \
'
