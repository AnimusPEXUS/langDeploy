#!/bin/bash

PPWD="`pwd`"

for i in rust cargo
do

    cd "$PPWD"

    if [ ! -d $i ]
    then
        git clone "git@github.com:rust-lang/$i.git" ./$i
    fi

    cd $i

    git pull

done

