#!/bin/bash

PPWD=$(realpath "$(dirname "$0")")
PPWD_emscripten="$PPWD/emscripten"

#echo "$PPWD"

function is_emscripten_exists {
    if [ -d "$PPWD_emscripten" ]; then
        return 1
    else
        return 0
    fi
}

function clone_new_emscripten {
    echo "clonning new emscripten"
    cd "$PPWD"
    if [ $? -ne 0 ]; then
        echo "couldn't cd to $PPWD"
        return 1
    fi

    rm -r "$PPWD_emscripten" 2>/dev/null

    git clone --recurse-submodules 'https://github.com/emscripten-core/emscripten.git' # 'https://github.com/emscripten-core/emscripten.git'
    if [ $? -ne 0 ]; then
        return 1
    fi

    return 0
}

function update_existing_emscripten {
    echo "updating emscripten"
    cd "$PPWD_emscripten"
    if [ $? -ne 0 ]; then
        return 1
    fi

    git pull --recurse-submodules
    if [ $? -ne 0 ]; then
        return 1
    fi

    return 0
}

echo "checking emscripten dir"
is_emscripten_exists
is_emscripten_exists_res=$?
if [ $is_emscripten_exists_res -eq 0 ]; then
    clone_new_emscripten
    if [ $? -ne 0 ]; then
        echo "couldn't clone new emscripten"
        exit 1
    fi
else
    update_existing_emscripten
    if [ $? -ne 0 ]; then
        echo "couldn't update existing emscripten"
        exit 1
    fi
fi
