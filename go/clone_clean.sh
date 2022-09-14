#!/bin/bash

PPWD="`pwd`"

rm "$PPWD/source"
git clone 'https://go.googlesource.com/go' "$PPWD/source"

