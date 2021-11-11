#!/bin/bash

wsl --import $1 'bin\'"$1"''-''"$2"'\' 'backups\'"$1"'-'"$2"'-backup.tar'

./lib/up_distro.sh $1 $2 $3
