#!/bin/bash

source lib/args.sh

./modules/$module/test_distro.sh -d $distro -m $module -u $user
