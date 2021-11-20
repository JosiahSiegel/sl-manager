#!/bin/bash

source ./lib/waiting.sh

COMMAND_PATH=./lib/commands/
COMMAND="\${COMMAND_PATH}\${FUNCNAME[0]}_distro.sh \$1 \$2 \$3"

init() {
    eval ${COMMAND}
}

destroy() {
    eval ${COMMAND} & waiting
}

install() {
    eval ${COMMAND}
}

docker() {
    eval ${COMMAND} & waiting
}

setup() {
    eval ${COMMAND} & waiting
}

test() {
    eval ${COMMAND}
}

enter() {
    eval ${COMMAND}
}

backup() {
    eval ${COMMAND} & waiting
}

down() {
    eval ${COMMAND} & waiting
}

fix() {
    eval ${COMMAND}
}

restore() {
    eval ${COMMAND} & waiting
}

status() {
    eval ${COMMAND} & waiting
}

up() {
    eval ${COMMAND} & waiting
}

tips() {
    eval ${COMMAND}
}
