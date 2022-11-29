#!/bin/bash

PPWD="$(pwd)"

for i in rust cargo; do # rustup

    cd "$PPWD"

    if [ ! -d $i ]; then
        git clone --recurse-submodules "git@github.com:rust-lang/$i.git" ./$i
    fi

    cd $i

    git pull --recurse-submodules

done
