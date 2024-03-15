#!/bin/bash

wsl --set-default $1

echo "Restarting docker"
powershell -c 'Stop-Process -Name "Docker Desktop"'
sleep 1
"C:\Program Files\Docker\Docker\Docker Desktop.exe"
sleep 1

echo "Waiting for docker..."
wsl -d $1 -e bash -c \
' \
until usermod -aG docker '"$3"'; do sleep 5; done \
' &>/dev/null

wsl -d $1 -u $3 -e bash -c \
' \
until docker info; do sleep 5; done \
' &>/dev/null

echo "Docker restart complete"
