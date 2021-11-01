#!/bin/bash

source lib/args.sh

./modules/$marg1/test_distro.sh -m0 $marg0 -m1 $marg1 -o0 $oarg0
