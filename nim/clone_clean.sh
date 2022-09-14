#!/bin/bash

PPWD="`pwd`"

rm "$PPWD/source"
git clone 'git@github.com:nim-lang/Nim.git' "$PPWD/source"

