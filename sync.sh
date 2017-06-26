#!/bin/bash

# copy fkm-mode and snippets from ~/.emacs.d to install directory

# make folders structure
script=`readlink -e "$0"`
script_path=`dirname "$script"`
home_path=~/
_emacs_d_path=~/.emacs.d
fkm_mode_path=~/.emacs.d/fkm-mode

echo "copy fkm mode"
if [ -e "$fkm_mode_path" ]
then
    cp -r $fkm_mode_path "$script_path"
fi

echo "copy snippets"
if [ -e "$_emacs_d_path/snippets" ]
then
    cp -r "$_emacs_d_path/snippets" "$script_path"
fi
