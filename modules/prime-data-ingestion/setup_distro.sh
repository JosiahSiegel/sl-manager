#!/bin/bash

wsl -d $1 -u $3 -e bash -c \
' \
docker --version; \
git --version; \
az --version; \
mkdir -p ~/repos/; \
cd ~/repos/; \
git clone https://github.com/CDCgov/prime-data-ingestion.git; \
cd prime-data-ingestion/; \
python3 -m venv .venv; \
source .venv/bin/activate; \
sudo chown -R '"$3"':'"$3"' .; \
echo "cd ~/repos/prime-data-ingestion/" >>~/.bashrc; \
code .; \
'
