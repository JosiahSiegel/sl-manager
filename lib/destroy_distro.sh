#!/bin/bash

./lib/down_distro.sh $1 $2 $3

wsl --unregister $1
