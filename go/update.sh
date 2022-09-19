#!/bin/bash

cd "$PPWD"

if [ ! -d ./source ]
then
    git clone "https://go.googlesource.com/go" ./source
fi

cd source

git pull



