#!/usr/bin/env bash

REMOTES=(
    "coreboot upstream https://github.com/coreboot/coreboot.git"
    "edk2 upstream https://github.com/tianocore/edk2.git"
    "edk2-platforms upstream https://github.com/tianocore/edk2-platforms.git"
)

set -e

function git_remote {
    echo -e "\x1B[1m$1\x1B[0m"
    cd "$1"
    if git remote | grep "^$2\$"
    then
        git remote set-url "$2" "$3"
    else
        git remote add "$2" "$3"
    fi
    git fetch "$2"
    cd ..
}

for remote in "${REMOTES[@]}"
do
    git_remote $remote
done
