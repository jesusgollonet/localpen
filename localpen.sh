#!/bin/bash

# run with source so you cd in your current session instead of a subshell
# copy template
# cd into directory
# launch servers
# open vim

create_dirname(){
    local prefix=htmlpen
    local suffix=$(date +%s)  # "+%s" seconds from unix 
    local dirname=$prefix"_"$suffix
    echo $dirname
}

copy_html_template_to(){
    echo 'copying html template'
    echo $dirname
    cp -r templates/html/ $1
}

cd_to(){
    echo 'cding to '
    ls $1
    echo $1
    cd $1 
}
open_vi(){
    vi .
}

main(){
   echo 'creating pen' 
   local dirname=$(create_dirname)
   copy_html_template_to $dirname
   cd_to $dirname
   open_vi
   echo "dirname ____  $dirname"
   #copyTemplate
}


main
