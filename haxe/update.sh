#!/bin/bash

PPWD=`realpath "\`dirname "$0"\`"`
PPWD_haxe="$PPWD/haxe"

#echo "$PPWD"

function is_haxe_exists {
    if [ -d "$PPWD_haxe" ]
    then
        return 1
    else 
        return 0
    fi
}

function clone_new_haxe {
    echo "clonning new haxe"
    cd "$PPWD"
    if [ $? -ne 0 ]
    then
	    echo "couldn't cd to $PPWD"
	    return 1
    fi

    rm -r "$PPWD_haxe" > /dev/null

    git clone --recursive 'https://github.com/HaxeFoundation/haxe.git'
    if [ $? -ne 0 ]
    then
        return 1
    fi

    return 0
}

function update_existing_haxe {
    echo "updating haxe"
    cd "$PPWD_haxe"
    if [ $? -ne 0 ]
    then
        return 1
    fi

    git pull
    if [ $? -ne 0 ]
    then
        return 1
    fi

    return 0
}

echo "checking haxe dir"
is_haxe_exists
is_haxe_exists_res=$?
echo "is_haxe_exists_res $is_haxe_exists_res"
if [ $is_haxe_exists_res -eq 0 ]
then
    clone_new_haxe
    if [ $? -ne 0 ]
    then
        echo "couldn't clone new haxe"
        exit 1
    fi
else
    update_existing_haxe
    if [ $? -ne 0 ]
    then
        echo "couldn't update existing haxe"
        exit 1
    fi
fi
