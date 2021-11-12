#!/bin/bash

FILE=./modules/$2/setup_distro.sh
if [[ -f "$FILE" ]]; then
    echo "Running module specific setup"
    $FILE $1 $2 $3 #>/dev/null
    echo "Completed module specific setup"
fi
