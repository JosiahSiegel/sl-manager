#!/bin/bash

source lib/args.sh

wsl --import $marg0 'bin\'"$marg0"''-''"$marg1"'\' 'backups\'"$marg0"'-'"$marg1"'-backup.tar'

./up_distro.sh -m0 $marg0 -m1 $marg1 -o0 $oarg0
