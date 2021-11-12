#!/bin/bash

init() {
    ./lib/commands/init_distro.sh $1 $2 $3
}

destroy() {
    ./lib/commands/destroy_distro.sh $1 $2 $3
    sleep 5
}

install() {
    wsl --install -d $1
    sleep 15
    echo "Creating dev env"
    echo ""
    echo "***"
    echo "CHANGE ROOT PASSWORD FROM 'temp'!"
    echo "User '"$3"'"
    echo "***"
    echo ""
    ./lib/commands/generic_setup.sh $1 $2 $3
    ./modules/$2/dev_setup.sh $1 $2 $3 &>/dev/null & waiting
}

docker() {
    ./lib/commands/fix_docker.sh $1 $2 $3
}

setup() {
    ./modules/$2/test_prep.sh $1 $2 $3 &>/dev/null & waiting
}

test() {
    ./lib/commands/test_distro.sh $1 $2 $3
}

enter() {
    ./lib/commands/enter_distro.sh $1 $2 $3
}

backup() {
    ./lib/commands/backup_distro.sh $1 $2 $3
}

down() {
    ./lib/commands/down_distro.sh $1 $2 $3
}

fix() {
    ./lib/commands/fix_distro.sh $1 $2 $3
}

restore() {
    ./lib/commands/restore_distro.sh $1 $2 $3
}

status() {
    ./lib/commands/status_distro.sh $1 $2 $3
}

up() {
    ./lib/commands/up_distro.sh $1 $2 $3
}