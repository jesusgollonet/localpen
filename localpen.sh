#!/bin/bash

set -e
# run with source so you cd in your current session instead of a subshell
# copy template
# cd into directory
# launch servers
# open vim

create_dirname(){
    local prefix suffix dirname
    prefix=htmlpen
    suffix="$(date +%s)"  # "+%s" seconds from unix 
    dirname=$prefix"_"$suffix
    echo "$dirname"
}

copy_html_template_to(){
    local dirname=$1
    echo "copying html template to $dirname"
    cp -r templates/html/. "$dirname"
}

cd_to(){
    local dirname
    dirname=$1
    echo "cd to $dirname"
    cd "$dirname" || exit
}

main(){
   echo 'creating pen' 
   local dirname
   dirname=$(create_dirname)
   copy_html_template_to "$dirname"
   cd_to "$dirname"
   $EDITOR .
   echo "dirname ____  $dirname"
}

main
