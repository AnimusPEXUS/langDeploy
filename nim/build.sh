#!/bin/bash

PPWD="`pwd`"
PPWD_SOURCE="$PPWD/source"
PPWD_TARGET="$PPWD/nim_$1"

cd "$PPWD_SOURCE"
git checkout master
git pull

#mkdir -p ../$1

cd "$PPWD"

cp -r "$PPWD_SOURCE" "$PPWD_TARGET"

cd "$PPWD_TARGET"

git checkout "$1"

cd src

bash ./all.bash


