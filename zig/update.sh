#!/bin/bash

cd "$PPWD"

if [ ! -d source ]
then
    git clone "git@github.com:ziglang/zig.git" ./source
fi

cd source

git pull



