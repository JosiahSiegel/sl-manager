#!/bin/bash

source lib/args.sh

wsl -d $marg0 -e bash -c \
' \
touch /home/'"$oarg0"'/.hushlogin; \
touch /home/'"$oarg0"'/.landscape; \
touch /home/'"$oarg0"'/.motd_shown; \
echo "'"$oarg0"' ALL=(ALL:ALL) NOPASSWD: ALL" | tee /etc/sudoers.d/'"$oarg0"'; \
chown -R '"$oarg0"':'"$oarg0"' /home/'"$oarg0"'/; \
apt update; \
apt-get update; \
apt-get -y upgrade; \
apt -y install openjdk-13-jdk; \
apt-get --yes install lsb-release gpg; \
curl https://packages.microsoft.com/keys/microsoft.asc \
    | gpg --dearmor \
    | tee "/etc/apt/trusted.gpg.d/microsoft.gpg"; \
echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-$(lsb_release -cs)-prod $(lsb_release -cs) main" \
    | tee "/etc/apt/sources.list.d/dotnetdev.list"; \
apt-get update; \
apt-get --yes install azure-functions-core-tools-3; \
apt-get --yes install azure-cli; \
apt-get -y install unzip; \
apt -y install gradle; \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -; \
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list; \
apt-get update; \
apt-get -y install postgresql-11; \
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose; \
chmod +x /usr/local/bin/docker-compose; \
'
