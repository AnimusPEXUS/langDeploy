#!/bin/bash

# function find_latest_version {
#     find_latest_version_res=`git tag | grep -x -P \'(\d+\.)+\d+\' | sort -V  | tail -n 1`
# }

PPWD=$(realpath "$(dirname "$0")")

if [ -z "$1" ]; then
    echo "requires parameter"
    exit 1
fi

TARGET_BUILD_DIR="$PPWD/rust-build-$1"
TARGET_INSTALL_DIR="$PPWD/rust-$1"

cd rust
if [ $? -ne 0 ]; then
    echo "couldn't cd to rust source dir"
    exit 2
fi

git pull --recurse-submodules
if [ $? -ne 0 ]; then
    echo "couldn't 'git pull' in rust source dir"
    exit 2
fi

cd "$PPWD"

echo "preparing building dir: $TARGET_BUILD_DIR"
if [ -d "$TARGET_BUILD_DIR" ]; then
    echo "building dir already exists, so it going to be reused. delete it, if you wish it to be recreated"
else
    echo "creating new building dir"
    cp -r rust "$TARGET_BUILD_DIR"
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

echo "configuring"
./configure \
    --enable-local-rust \
    --enable-llvm-link-shared \
    --llvm-config=/usr/bin/llvm-config-64 \
    --prefix="$TARGET_INSTALL_DIR"

# --enable-extended \
# --llvm-config=/usr/bin/llvm-config-64 \
# --sysconfdir="/etc"
# --enable-vendor \
# --sysconfdir="$TARGET_INSTALL_DIR/etc"

if [ $? -ne 0 ]; then
    echo "configuring error"
    exit 2
fi

echo "building"
./x.py build
if [ $? -ne 0 ]; then
    echo "build error"
    exit 2
fi

echo "installing"
# DESTDIR="$TARGET_INSTALL_DIR"
./x.py install
if [ $? -ne 0 ]; then
    echo "install error"
    exit 2
fi

echo "rust built and installed"

# #echo "removing $TARGET_BUILD_DIR"
# #rm -r "$TARGET_BUILD_DIR"
