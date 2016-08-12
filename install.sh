#!/bin/bash

echo "install g++" #~
sudo apt-get install g++ -y -f #~
echo "install emacs24..." #~
sudo apt-get install emacs24 -y -f #~

# make folders structure
script=`readlink -e "$0"`
script_path=`dirname "$script"`
home_path=~/
_emacs_d_path=~/.emacs.d
xopeck_mode_path=~/.emacs.d/xopeck-mode

## functions
create_folder() {
    # take path and make folder
    if [ ! -z $1 ]
    then
        if [ ! -e $1 ]
        then mkdir $1
        elif [ ! -d $1 ]
        then
            rm $1
            mkdir $1
        fi
    fi
}

## make .emacs.d folder
create_folder "$_emacs_d_path"

## make .emacs.d/xopeck-mode folder
create_folder "$xopeck_mode_path"
## todo: cp xopeck-mode

create_folder "$_emacs_d_path/snippets"

create_folder "$script_path/tmp"

# install apt-get plugins
sudo apt-get install python3-pip -y -f #~
sudo pip3 install pylint #~
###sudo apt-get install pylint -y -f # rm or do something for using 3 and 2 pylint
sudo pip2 install virtualenv #~
## flycheck for css and js
sudo apt-get install nodejs-legacy -y -f
sudo apt-get install npm -y -f
sudo npm install -g jshint
sudo npm install -g csslint
## scss
sudo apt-get install ruby -y -f
sudo gem install sass
## js
sudo npm install --save-dev babel-cli -g
sudo npm install --save-dev babel-preset-es2015 -g
sudo npm install babel-plugin-transform-es2015-modules-umd
sudo npm install babel-plugin-transform-es2015-modules-amd
sudo npm install -g browserify
sudo npm install -g watchify


# install melpa plugins
# todo: add close emacs after installing melpa packages
cp "$script_path/install-melpa-packages.el" "$home_path/.emacs"
sudo emacs #~
# todo: cp normal file and save previous .emacs.d or smth else
cp "$script_path/.emacs" "$home_path/.emacs"

# other
# generate pylint configering file (for flycheck)
pylint --generate-rcfile > "$home_path/.pylintrc" #~
# todo: cp my .pylintrc file?
# load cpplint (for flycheck)
wget -o "$script_path/tmp/cpplint.py" https://raw.githubusercontent.com/google/styleguide/gh-pages/cpplint/cpplint.py #~
sudo mv cpplint.py /usr/local/bin/cpplint.py #~
sudo chmod 755 /usr/local/bin/cpplint.py #~
# todo: cp cpplint.py if can't load


# install xopeck-mode
# copy snippets
cp "$script_path/snippets" "$_emacs_d_path" -r #~
# make hotkeys
$script_path/Hotkeys.py "$script_path/Hotkeys.txt" "$script_path/xopeck-mode/xop-hotkeys.el"
# copy xopeck-mode
cp "$script_path/xopeck-mode" "$_emacs_d_path" -r

