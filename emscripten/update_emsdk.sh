#!/bin/bash

PPWD=$(realpath "$(dirname "$0")")
PPWD_emsdk="$PPWD/emsdk"

#echo "$PPWD"

function is_emsdk_exists {
    if [ -d "$PPWD_emsdk" ]; then
        return 1
    else
        return 0
    fi
}

function clone_new_emsdk {
    echo "clonning new emsdk"
    cd "$PPWD"
    if [ $? -ne 0 ]; then
        echo "couldn't cd to $PPWD"
        return 1
    fi

    rm -r "$PPWD_emsdk" 2>/dev/null

    git clone --recurse-submodules 'https://github.com/emscripten-core/emsdk'
    if [ $? -ne 0 ]; then
        return 1
    fi

    return 0
}

function update_existing_emsdk {
    echo "updating emsdk"
    cd "$PPWD_emsdk"
    if [ $? -ne 0 ]; then
        return 1
    fi

    git pull --recurse-submodules
    if [ $? -ne 0 ]; then
        return 1
    fi

    return 0
}

echo "checking emsdk dir"
is_emsdk_exists
is_emsdk_exists_res=$?
if [ $is_emsdk_exists_res -eq 0 ]; then
    clone_new_emsdk
    if [ $? -ne 0 ]; then
        echo "couldn't clone new emsdk"
        exit 1
    fi
else
    update_existing_emsdk
    if [ $? -ne 0 ]; then
        echo "couldn't update existing emsdk"
        exit 1
    fi
fi
