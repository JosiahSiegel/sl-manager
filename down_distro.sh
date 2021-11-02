#!/bin/bash

source lib/args.sh

./modules/$module/down_distro.sh -d $distro -m $module -u $user
