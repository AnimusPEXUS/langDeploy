#!/bin/bash

# function find_latest_version {
#     find_latest_version_res=`git tag | grep -x -P \'(\d+\.)+\d+\' | sort -V  | tail -n 1`
# }

PPWD=$(realpath "$(dirname "$0")")

if [ -z "$1" ]; then
    echo "requires parameter"
    exit 1
fi

TARGET_BUILD_DIR="$PPWD/cargo-build-$1"
TARGET_INSTALL_DIR="$PPWD/cargo-$1"

cd cargo
if [ $? -ne 0 ]; then
    echo "couldn't cd to cargo source dir"
    exit 2
fi

git pull
if [ $? -ne 0 ]; then
    echo "couldn't 'git pull' in cargo source dir"
    exit 2
fi

cd "$PPWD"

echo "preparing building dir: $TARGET_BUILD_DIR"
if [ -d "$TARGET_BUILD_DIR" ]; then
    echo "building dir already exists, so it going to be reused. delete it, if you wish it to be recreated"
else
    echo "creating new building dir"
    cp -r cargo "$TARGET_BUILD_DIR"
fi

cd "$TARGET_BUILD_DIR"
if [ $? -ne 0 ]; then
    echo "couldn't cd to $TARGET_BUILD_DIR"
    exit 2
fi

echo "git pull"
git pull
if [ $? -ne 0 ]; then
    echo "git error"
    exit 2
fi

echo "git checkout $1"
git checkout "$1"
if [ $? -ne 0 ]; then
    echo "git error"
    exit 2
fi

cargo build --release
if [ $? -ne 0 ]; then
    echo "build error"
    exit 2
fi

cargo install --path .
if [ $? -ne 0 ]; then
    echo "install error"
    exit 2
fi

echo "cargo build and install completed"
