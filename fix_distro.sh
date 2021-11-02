#!/bin/bash

source lib/args.sh

./modules/$module/fix_distro.sh -d $distro -m $module -u $user
