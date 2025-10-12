#!/bin/bash

PPWD=~/langDeploy/go
PPWD_SOURCE="$PPWD/source"
PPWD_TARGET="$PPWD/go_$1"

cd "$PPWD_SOURCE"
git checkout --recurse-submodules master
git pull --recurse-submodules

#mkdir -p ../$1

cd "$PPWD"

cp -r "$PPWD_SOURCE" "$PPWD_TARGET"

cd "$PPWD_TARGET"

git checkout --recurse-submodules "$1"

cd src

bash ./all.bash

echo "script end"