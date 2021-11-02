#!/bin/bash

source lib/args.sh

wsl --export $distro 'backups\'"$distro"'-'"$module"'-backup.tar'
