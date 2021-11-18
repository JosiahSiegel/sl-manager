#!/bin/bash

source ./lib/waiting.sh

wsl --install -d $1
sleep 15

echo "Creating dev env"
echo ""
echo "***"
echo "CHANGE ROOT PASSWORD FROM 'temp'!"
echo "User '"$3"'"
echo "***"
echo ""

wsl -d $1 -e bash -c \
' \
echo "root:temp" | chpasswd; \
useradd -m '"$3"'; \
echo "'"$3"' ALL=(ALL:ALL) NOPASSWD: ALL" | tee /etc/sudoers.d/'"$3"'; \
chown -R '"$3"':'"$3"' /home/'"$3"'/; \
'

./lib/commands/gpg_import.sh $1 $2 $3

wsl -d $1 -u $3 -e bash -c \
' \
echo "cd ~" >>~/.bashrc; \
'

FILE=./modules/$2/install_distro.sh
if [[ -f "$FILE" ]]; then
    echo "Running module specific install"
    $FILE $1 $2 $3 &>/dev/null & waiting
    echo "Completed module specific install"
fi
