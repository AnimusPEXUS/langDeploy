#!/bin/bash

cd "$PPWD"

if [ ! -d $i ]
then
    git clone "git@github.com:nim-lang/Nim.git" ./source
fi

cd source

git pull



