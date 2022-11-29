#!/bin/bash

cd "$PPWD"

if [ ! -d source ]; then
    git clone "git@github.com:terralang/terra.git" ./source
fi

cd source

git pull
