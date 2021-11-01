#!/bin/bash

source lib/args.sh

./lib/fix_docker.sh -m0 $marg0 -m1 $marg1 -o0 $oarg0

./modules/$marg1/up_distro.sh -m0 $marg0 -m1 $marg1 -o0 $oarg0
