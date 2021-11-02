#!/bin/bash

source lib/args.sh

./lib/fix_docker.sh -d $distro -m $module -u $user

./modules/$module/up_distro.sh -d $distro -m $module -u $user
