#!/bin/bash

source lib/waiting.sh
source lib/args.sh

./modules/$module/fix_docker.sh -d $distro -m $module -u $user
