#!/bin/bash

PPWD="`pwd`"

for i in dmd druntime dub phobos tools
do
    rm "$PPWD/$i"
    git clone "git@github.com:dlang/$i.git" "$PPWD/$i"
done

