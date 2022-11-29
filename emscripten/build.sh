#!/bin/bash

PPWD=`realpath "\`dirname "$0"\`"`
PPWD_emsdk="$PPWD/emsdk"

if [ -z "$1" ]
then
    echo "requires parameter"
    exit 1
fi

PPWD_emsdk_build="$PPWD/emsdk_$1"

rm -r "$PPWD_emsdk_build" > /dev/null

cp -a "$PPWD_emsdk" "$PPWD_emsdk_build"
if [ $? -ne 0 ]
then
    echo "couldn't copy $PPWD_emsdk to $PPWD_emsdk_build"
    exit 1
fi

cd "$PPWD_emsdk_build"
if [ $? -ne 0 ]
then
    echo "some problems with $PPWD_emsdk_build dir: couldn't cd"
    exit 1
fi

git checkout "$1"
if [ $? -ne 0 ]
then
    echo "some problems with $PPWD_emsdk_build dir: couldn't git checkout $1"
    exit 1
fi

# ./emsdk install latest
# if [ $? -ne 0 ]
# then
#     echo "some problems with $PPWD_emsdk_build dir: couldn't ./emsdk install latest"
#     exit 1
# fi

# ./emsdk activate latest
# if [ $? -ne 0 ]
# then
#     echo "some problems with $PPWD_emsdk_build dir: couldn't ./emsdk activate latest"
#     exit 1
# fi

emscripten_file="$PPWD_emsdk_build/.emscripten"

echo '' > "$emscripten_file"
echo "emsdk_path = \"$PPWD_emsdk_build\"" >> "$emscripten_file"
echo "NODE_JS = 'node'" >> "$emscripten_file"
echo "LLVM_ROOT = '/usr'" >> "$emscripten_file"
echo "BINARYEN_ROOT = '/usr'" >> "$emscripten_file"
echo "EMSCRIPTEN_ROOT = emsdk_path + '/upstream/emscripten'" >> "$emscripten_file"
echo "COMPILER_ENGINE = NODE_JS" >> "$emscripten_file"
echo "JS_ENGINES = [NODE_JS]" >> "$emscripten_file"

