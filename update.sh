#!/bin/bash

script=`readlink -e "$0"`
script_path=`dirname "$script"`
home_path=~/
_emacs_d_path=~/.emacs.d
xopeck_mode_path=~/.emacs.d/xopeck-mode

echo "update hotkeys"
# make hotkeys
$script_path/Hotkeys.py "$script_path/Hotkeys.txt" "$script_path/xopeck-mode/xop-hotkeys.el"
cp "$script_path/xopeck-mode/xop-hotkeys.el" "$xopeck_mode_path/xop-hotkeys.el"
