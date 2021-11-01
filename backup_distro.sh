#!/bin/bash

source lib/args.sh

wsl --export $marg0 'backups\'"$marg0"'-'"$marg1"'-backup.tar'
