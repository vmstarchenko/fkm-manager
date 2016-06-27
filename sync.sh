#!/bin/bash

# copy xopeck-mode and snippets from ~/.emacs.d to install directory

# make folders structure
script=`readlink -e "$0"`
script_path=`dirname "$script"`
home_path=~/
_emacs_d_path=~/.emacs.d
xopeck_mode_path=~/.emacs.d/xopeck-mode

echo "copy xopeck mode"
if [ -e "$xopeck_mode_path" ]
then
    cp -r $xopeck_mode_path "$script_path"
fi

echo "copy snippets"
if [ -e "$_emacs_d_path/snippets" ]
then
    cp -r "$_emacs_d_path/snippets" "$script_path"
fi
