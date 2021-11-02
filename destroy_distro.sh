#!/bin/bash

source lib/args.sh

./down_distro.sh -d $distro -m $module -u $user

wsl --unregister $distro
