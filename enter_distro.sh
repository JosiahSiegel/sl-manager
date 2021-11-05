#!/bin/bash

source lib/args.sh

wsl -d $distro -u $user -e bash
