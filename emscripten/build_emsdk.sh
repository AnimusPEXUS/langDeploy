#!/bin/bash

PPWD=$(realpath "$(dirname "$0")")
PPWD_emsdk="$PPWD/emsdk"

if [ -z "$1" ]; then
    echo "requires parameter"
    exit 1
fi

PPWD_emsdk_build="$PPWD/emsdk_$1"

rm -rf "$PPWD_emsdk_build" >/dev/null

cp -a "$PPWD_emsdk" "$PPWD_emsdk_build"
if [ $? -ne 0 ]; then
    echo "couldn't copy $PPWD_emsdk to $PPWD_emsdk_build"
    exit 1
fi

cd "$PPWD_emsdk_build"
if [ $? -ne 0 ]; then
    echo "some problems with $PPWD_emsdk_build dir: couldn't cd"
    exit 1
fi

# git checkout --recurse-submodules "$1"
# if [ $? -ne 0 ]; then
#     echo "some problems with $PPWD_emsdk_build dir: couldn't git checkout $1"
#     exit 1
# fi

# ./emsdk update
# if [ $? -ne 0 ]; then
#     echo "emsdk update error"
#     exit 1
# fi

./emsdk install "$1"
if [ $? -ne 0 ]; then
    echo "emsdk update error"
    exit 1
fi

./emsdk activate "$1"
if [ $? -ne 0 ]; then
    echo "emsdk update error"
    exit 1
fi
