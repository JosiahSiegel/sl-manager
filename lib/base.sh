#!/bin/bash

init() {
    ./lib/init_distro.sh $1 $2 $3
}

destroy() {
    ./lib/destroy_distro.sh $1 $2 $3
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
    ./lib/generic_setup.sh $1 $2 $3
    ./modules/$2/dev_setup.sh $1 $2 $3 &>/dev/null & waiting
}

docker() {
    ./lib/fix_docker.sh $1 $2 $3
}

setup() {
    ./modules/$2/test_prep.sh $1 $2 $3 &>/dev/null & waiting
}

test() {
    ./lib/test_distro.sh $1 $2 $3
}

enter() {
    ./lib/enter_distro.sh $1 $2 $3
}

backup() {
    ./lib/backup_distro.sh $1 $2 $3
}

down() {
    ./lib/down_distro.sh $1 $2 $3
}

fix() {
    ./lib/fix_distro.sh $1 $2 $3
}

restore() {
    ./lib/restore_distro.sh $1 $2 $3
}

status() {
    ./lib/status_distro.sh $1 $2 $3
}

up() {
    ./lib/up_distro.sh $1 $2 $3
}