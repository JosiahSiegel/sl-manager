#!/bin/bash

source lib/waiting.sh
source lib/args.sh

wsl --set-default $marg0

echo "Restarting docker"
powershell -c 'Stop-Process -Name "Docker Desktop"'
sleep 1
powershell -c 'Start-Process "C:\Program Files\Docker\Docker\Docker Desktop.exe"'
sleep 1

echo "Waiting for docker..."
wsl -d $marg0 -e bash -c \
' \
until usermod -aG docker '"$oarg0"'; do sleep 5; done \
' &>/dev/null &
waiting

wsl -d $marg0 -u $oarg0 -e bash -c \
' \
until docker info; do sleep 5; done \
' &>/dev/null &
waiting

echo "Docker restart complete"
