#!/bin/bash

echo ""
echo "***"
echo "Setting up gpg"
echo "Importing \\backups\\*.pgp files:"
echo "***"
echo ""
wsl -d $1 -u $3 -e bash -c \
' \
path=$(wslpath -u '"$PWD"')/backups/; \
path=$(echo $path | sed "s3/c/c/3/c/3g"); \
gpg --pinentry-mode loopback --import $path/*.pgp; \
cp $path/.gitconfig ~/.gitconfig; \
cp $path/.gitconfig /home/'"$3"'/.gitconfig; \
sudo chown -R '"$3"':'"$3"' /home/'"$3"'/.gitconfig; \
echo "export GPG_TTY=\$(tty)" >>~/.bashrc; \
echo "cd ~" >>~/.bashrc; \
'
echo ""
echo "***"
echo "Import complete"
echo "***"
echo ""
