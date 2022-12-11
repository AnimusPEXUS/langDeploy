#!/bin/bash

PPWD=$(realpath "$(dirname "$0")")
PPWD_emscripten="$PPWD/emscripten"

if [ -z "$1" ]; then
    echo "requires parameter"
    exit 1
fi

PPWD_emscripten_build="$PPWD/emscripten_$1"

rm -rf "$PPWD_emscripten_build" >/dev/null

cp -a "$PPWD_emscripten" "$PPWD_emscripten_build"
if [ $? -ne 0 ]; then
    echo "couldn't copy $PPWD_emscripten to $PPWD_emscripten_build"
    exit 1
fi

cd "$PPWD_emscripten_build"
if [ $? -ne 0 ]; then
    echo "some problems with $PPWD_emscripten_build dir: couldn't cd"
    exit 1
fi

git checkout --recurse-submodules "$1"
if [ $? -ne 0 ]; then
    echo "some problems with $PPWD_emscripten_build dir: couldn't git checkout $1"
    exit 1
fi

emscripten_file="$PPWD_emscripten_build/.emscripten"

echo '' >"$emscripten_file"
echo "emscripten_path = \"$PPWD_emscripten_build\"" >>"$emscripten_file"
echo "NODE_JS = 'node'" >>"$emscripten_file"
echo "LLVM_ROOT = '/usr/bin'" >>"$emscripten_file"
echo "BINARYEN_ROOT = '/usr'" >>"$emscripten_file"
echo "EMSCRIPTEN_ROOT = emscripten_path + '/upstream/emscripten'" >>"$emscripten_file"
echo "COMPILER_ENGINE = NODE_JS" >>"$emscripten_file"
echo "JS_ENGINES = [NODE_JS]" >>"$emscripten_file"
