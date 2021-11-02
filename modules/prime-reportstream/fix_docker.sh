#!/bin/bash

source lib/waiting.sh
source lib/args.sh

wsl --set-default $distro

echo "Restarting docker"
powershell -c 'Stop-Process -Name "Docker Desktop"'
sleep 1
powershell -c 'Start-Process "C:\Program Files\Docker\Docker\Docker Desktop.exe"'
sleep 1

echo "Waiting for docker..."
wsl -d $distro -e bash -c \
' \
until usermod -aG docker '"$user"'; do sleep 5; done \
' &>/dev/null &
waiting

wsl -d $distro -u $user -e bash -c \
' \
until docker info; do sleep 5; done \
' &>/dev/null &
waiting

echo "Docker restart complete"
