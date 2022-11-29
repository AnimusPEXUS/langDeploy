#!/bin/bash

# function find_latest_version {
#     find_latest_version_res=`git tag | grep -x -P \'(\d+\.)+\d+\' | sort -V  | tail -n 1`
# }

PPWD=$(realpath "$(dirname "$0")")

if [ -z "$1" ]; then
    echo "requires parameter"
    exit 1
fi

TARGET_BUILD_DIR="$PPWD/rustup-build-$1"

cd rustup
if [ $? -ne 0 ]; then
    echo "couldn't cd to rustup source dir"
    exit 2
fi

git pull --recurse-submodules
if [ $? -ne 0 ]; then
    echo "couldn't 'git pull' in rustup source dir"
    exit 2
fi

cd "$PPWD"

echo "preparing building dir: $TARGET_BUILD_DIR"
if [ -d "$TARGET_BUILD_DIR" ]; then
    echo "building dir already exists, so it going to be reused. delete it, if you wish it to be recreated"
else
    echo "creating new building dir"
    cp -r rustup "$TARGET_BUILD_DIR"
fi

cd "$TARGET_BUILD_DIR"
if [ $? -ne 0 ]; then
    echo "couldn't cd to $TARGET_BUILD_DIR"
    exit 2
fi

echo "git checkout master"
git checkout -f --recurse-submodules master
if [ $? -ne 0 ]; then
    echo "git error"
    exit 2
fi

echo "git pull"
git pull --recurse-submodules
if [ $? -ne 0 ]; then
    echo "git error"
    exit 2
fi

echo "git checkout $1"
git checkout -f --recurse-submodules "$1"
if [ $? -ne 0 ]; then
    echo "git error"
    exit 2
fi

cargo run --release
if [ $? -ne 0 ]; then
    echo "cargo run --release error"
    exit 2
fi

echo "done"
