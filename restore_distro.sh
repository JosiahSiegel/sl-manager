#!/bin/bash

source lib/args.sh

wsl --import $distro 'bin\'"$distro"''-''"$module"'\' 'backups\'"$distro"'-'"$module"'-backup.tar'

./up_distro.sh -d $distro -m $module -u $user
