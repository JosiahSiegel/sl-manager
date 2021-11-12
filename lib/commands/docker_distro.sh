#!/bin/bash

FILE=./modules/$2/docker_distro.sh
if [[ -f "$FILE" ]]; then
    echo "Updating docker"
    $FILE $1 $2 $3
    echo "Docker update complete"
fi
