# Installation

## Install g++

```bash
sudo apt-get install g++ -y -f
```

## Install python3

```bash
sudo apt-get install python3 -y -f
wget https://bootstrap.pypa.io/get-pip.py
sudo python3 get-pip.py
```

## Install emacs (version=>24)
### depandances

```bash
sudo apt-get install build-essential texinfo libx11-dev libxpm-dev libjpeg-dev libpng-dev libgif-dev libtiff-dev libgtk2.0-dev libncurses-dev libxpm-dev automake autoconf -y -f
```

### sources

```bash
wget https://ftp.gnu.org/gnu/emacs/emacs-25.1.tar.gz
tar -xf emacs-25.1.tar.*
cd emacs-25.1/
./configure
make
sudo make install
cd ..
```

## Install plugins
### python3.5
### clang-format (c/c++)

```bash
sudo apt-get install clang-3.8 lldb-3.8 clang-format-3.8 -y -f
sudo ln -s /usr/bin/clang-format-3.8 /usr/bin/clang-format
```

### pylint (python)

```bash
sudo python3 -m pip install pylint
# optionally
pylint --generate-rcfile > "$home_path/.pylintrc"
```

### virtualenv

```bash
sudo python3 -m pip install virtualenv
```

### pyformat

```bash
sudo python3 -m pip install pyformat
```

### mypy

```bash
sudo python3 -m pip install mypy
```
