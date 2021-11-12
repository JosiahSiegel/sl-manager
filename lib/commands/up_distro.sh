#!/bin/bash

./lib/commands/fix_docker.sh $1 $2 $3

./modules/$2/up_distro.sh $1 $2 $3
