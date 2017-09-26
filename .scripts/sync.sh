#!/bin/bash

# copy fkm-mode and snippets from ~/.emacs.d to install directory

# make folders structure
script=`readlink -e "$0"`
scripts_path=`dirname "$script"`
base_dir=`realpath "$scripts_path/.."`

home_path=~/
_emacs_d_path=~/.emacs.d
fkm_mode_path=~/.emacs.d/fkm-mode

rm -rf "$base_dir/src"
mkdir "$base_dir/src"

echo "copy fkm mode"
if [ -e "$fkm_mode_path" ]
then
    cp -r "$fkm_mode_path" "$base_dir/src"
fi

echo "copy snippets"
if [ -e "$_emacs_d_path/snippets" ]
then
    cp -r "$_emacs_d_path/snippets" "$base_dir/src"
    echo "$_emacs_d_path/snippets"
fi
