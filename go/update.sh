#!/bin/bash

cd ~/langDeploy/go

if [ ! -d ./source ]; then
    git clone --recurse-submodules "https://go.googlesource.com/go" ./source
fi

cd source

git pull --recurse-submodules
