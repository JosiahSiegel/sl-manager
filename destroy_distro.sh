#!/bin/bash

source lib/args.sh

./down_distro.sh -m0 $marg0 -m1 $marg1 -o0 $oarg0

wsl --unregister $marg0
