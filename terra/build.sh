#!/bin/bash

PPWD="`pwd`"

if [ -z "$1" ]
then
    echo "requires parameter"
    exit 1
fi

TARGET_BUILD_DIR="$PPWD/terra-build-$1"
TARGET_INSTALL_DIR="$PPWD/terra-$1"

echo "preparing building dir: $TARGET_BUILD_DIR"

if [ ! -d "$TARGET_BUILD_DIR" ]
then
    cp -r source "$TARGET_BUILD_DIR"
fi

cd "$TARGET_BUILD_DIR"

echo "git checkout $1"
git checkout "$1"
if [ $? -ne 0 ]
then
    echo "configureing error"
    exit 2
fi

cd "$TARGET_BUILD_DIR/build"

echo "configuring.."
cmake -DCMAKE_INSTALL_PREFIX="$TARGET_INSTALL_DIR" ..
if [ $? -ne 0 ]
then
    echo "error"
    exit 2
fi

echo "building and installing.."
make install -j2
if [ $? -ne 0 ]
then
    echo "error"
    exit 2
fi

echo "terra built and installed"

#echo "removing $TARGET_BUILD_DIR"
#rm -r "$TARGET_BUILD_DIR"
