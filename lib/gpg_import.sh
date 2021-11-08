#!/bin/bash

source lib/waiting.sh
source lib/args.sh

wsl -d $distro -u $user -e bash -c \
' \
path=$(wslpath -u '"$PWD"')/backups/; \
path=$(echo $path | sed "s3/c/c/3/c/3g"); \
gpg --pinentry-mode loopback --import $path/*.pgp; \
cp $path/.gitconfig ~/.gitconfig; \
cp $path/.gitconfig /home/'"$user"'/.gitconfig; \
sudo chown -R '"$user"':'"$user"' /home/'"$user"'/.gitconfig; \
export GPG_TTY=$(tty); \
'
