#!/bin/bash

cd "$PPWD"

if [ ! -d $i ]
then
    git clone "https://go.googlesource.com/go" ./source
fi

cd source

git pull



