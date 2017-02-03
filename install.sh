#!/bin/bash

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


# make folders structure
script=`readlink -e "$0"`
script_path=`dirname "$script"`
tmp_path="$script_path/tmp/"
home_path=~/
_emacs_d_path=~/.emacs.d
xopeck_mode_path=~/.emacs.d/xopeck-mode

## make .emacs.d folder
create_folder "$_emacs_d_path"

## make .emacs.d/xopeck-mode folder
create_folder "$xopeck_mode_path"
create_folder "$_emacs_d_path/snippets"

## tmp
create_folder $tmp_path
cd $tmp_path

echo "install g++" #~
sudo apt-get install g++ -y -f #~
sudo apt-get install python3 -y -f #~

echo "install emacs24..." #~
# load x
echo "depandances..."
sudo apt-get install build-essential texinfo libx11-dev libxpm-dev libjpeg-dev libpng-dev libgif-dev libtiff-dev libgtk2.0-dev libncurses-dev -y -f
# load emacs
echo "load emacs from ftp.gnu.org..."
sudo wget https://ftp.gnu.org/gnu/emacs/emacs-25.1.tar.gz
tar -xf emacs-25.1.tar.*
cd "emacs-25.1/"
# install emacs
./configure
sudo make
sudo make install
cd ".."
rm -r "emacs-25.1/"
rm emacs-25.1.tar.*

# install apt-get plugins
sudo apt-get install python3-pip -y -f #~

# clang-format
sudo apt-get install clang-3.8 lldb-3.8 clang-format-3.8 -y -f #~
sudo ln -s /usr/bin/clang-format-3.8 /usr/bin/clang-format

# pip
sudo pip3 install pylint #~
###sudo apt-get install pylint -y -f # rm or do something for using 3 and 2 pylint
sudo pip2 install virtualenv #~
sudo pip install pyformat # ???
## flycheck for css and js
# sudo apt-get install nodejs-legacy -y -f
# sudo apt-get install npm -y -f
# sudo npm install -g jshint
# sudo npm install -g csslint
# sudo npm install -g sass-lint
# # TODO: add copy .lint-config files

# ## scss
# sudo apt-get install ruby -y -f
# sudo gem install sass
## js
# sudo npm install babel-cli -g
# sudo npm install babel-preset-es2015 -g
# sudo npm install babel-plugin-transform-es2015-modules-umd -g
# sudo npm install babel-plugin-transform-es2015-modules-amd -g
# sudo npm install -g browserify
# sudo npm install -g watchify

## latex
# sudo apt-get install texlive -f -y

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
sudo wget -o "$script_path/tmp/cpplint.py" https://raw.githubusercontent.com/google/styleguide/gh-pages/cpplint/cpplint.py #~
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

chown vladimir ~/.emacs.d -R
