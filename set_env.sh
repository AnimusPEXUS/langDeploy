#!/bin/bash


export LANG_DEPLOY_ROOT="$HOME/langDeploy"

for lang_name in go d nim rust
do
    file_to_source="$LANG_DEPLOY_ROOT/$lang_name/set_env.sh"
    if [ -f "$file_to_source" -a -x "$file_to_source" ]
    then
        source "$file_to_source"
    fi
done
unset lang_name
unset file_to_surce

unset LANG_DEPLOY_ROOT
