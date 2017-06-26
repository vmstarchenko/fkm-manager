#!/bin/bash

script=`readlink -e "$0"`
script_path=`dirname "$script"`
home_path=~/
_emacs_d_path=~/.emacs.d
fkm_mode_path=~/.emacs.d/fkm-mode

echo "update hotkeys"
# make hotkeys
$script_path/Hotkeys.py "$script_path/Hotkeys.txt" "$script_path/fkm-mode/fkm:hotkeys.el"
cp "$script_path/fkm-mode/fkm:hotkeys.el" "$fkm_mode_path/fkm:hotkeys.el"
