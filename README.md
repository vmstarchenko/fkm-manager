## Requirements

- g++
- python3
```bash
sudo apt-get install python3 -y -f
wget https://bootstrap.pypa.io/get-pip.py
sudo python3 get-pip.py
```

- emacs (version=>24)

```bash
sudo apt-get install build-essential texinfo libx11-dev libxpm-dev libjpeg-dev libpng-dev libgif-dev libtiff-dev libgtk2.0-dev libncurses-dev libxpm-dev automake autoconf -y -f

wget https://ftp.gnu.org/gnu/emacs/emacs-25.3.tar.xz
tar -xf emacs-25.1.tar.*
cd emacs-25.1/
./configure
make
sudo make install
```

- for c++-mode

clang-format

```bash
sudo apt-get install clang-format
```

- for python-mode

pylint, virtualenv, pyformat, mypy

```bash
sudo python3 -m pip install pylint virtualenv pyformat, mypy
```

## Installation

```bash
make install
```

add to your `.emacs` config

```elisp
(add-to-list 'load-path "~/.emacs.d/fkm-mode")
(require 'fkm-mode)
```
