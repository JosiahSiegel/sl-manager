#!/bin/bash

wsl --export $1 'backups\'"$1"'-'"$2"'-backup.tar'
