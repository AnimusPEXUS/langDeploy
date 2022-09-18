#!/bin/bash

PPWD="`pwd`"

if [ -z "$1" ]
then
    echo "requires parameter"
    exit 1
fi

TARGET_BUILD_DIR="$PPWD/rust-build-$1"
TARGET_INSTALL_DIR="$PPWD/rust-$1"

echo "preparing building dir: $TARGET_BUILD_DIR"
#if [ -e "$TARGET_BUILD_DIR" ]
#then
#    echo "cleaning up existing building dir"
#    rm "$TARGET_BUILD_DIR"
#    if [ $? -ne 0 ]
#    then
#        echo "can't delete existing building dir"
#        exit 2
#    fi
#fi

if [ ! -d "$TARGET_BUILD_DIR" ]
then
    # mkdir -p "$TARGET_BUILD_DIR"
    cp -r rust "$TARGET_BUILD_DIR"
fi

cd "$TARGET_BUILD_DIR"

echo "git checkout $1"
git checkout "$1"
if [ $? -ne 0 ]
then
    echo "configureing error"
    exit 2
fi

echo "configuring"
./configure --prefix="$TARGET_INSTALL_DIR" --llvm-config=/usr/bin/llvm-config-64
if [ $? -ne 0 ]
then
    echo "configureing error"
    exit 2
fi

echo "building"
./x.py build
if [ $? -ne 0 ]
then
    echo "build error"
    exit 2
fi

echo "installing"
./x.py install
if [ $? -ne 0 ]
then
    echo "install error"
    exit 2
fi

echo "rust built and installed"

#echo "removing $TARGET_BUILD_DIR"
#rm -r "$TARGET_BUILD_DIR"
