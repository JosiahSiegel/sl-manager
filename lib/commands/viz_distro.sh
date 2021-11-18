#!/bin/bash

FILE=./modules/$2/viz_distro.sh
if [[ -f $FILE ]]; then
    echo -e "=======================\n"
    echo -e "# MODULE SPECIFIC VIZ\n"
    echo -e "======================="
    $FILE $1 $2 $3
fi
