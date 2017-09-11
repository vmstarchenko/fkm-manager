#! /usr/bin/env python3

import tempfile
import os
import shutil

BASE_DIR = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))

class KeepDotEmacs:
    def __init__(self):
        _, self.tmp_file = tempfile.mkstemp()
        self.dot_emacs = os.path.realpath(os.path.expanduser('~/.emacs'))

    def __enter__(self):
        shutil.copyfile(self.dot_emacs, self.tmp_file)
        return self

    def __exit__(self, *args):
        try:
            shutil.copyfile(self.tmp_file, self.dot_emacs)
        except:
            print('Cant copy file backward: your .emacs in %s file' %self.tmp_file)
            raise
        os.unlink(self.tmp_file)

def main():
    with KeepDotEmacs():
        dot_emacs = os.path.realpath(os.path.expanduser('~/.emacs'))
        shutil.copyfile(
            os.path.join(BASE_DIR, 'install-melpa-packages.el'),
            dot_emacs)
        os.system('emacs')


if __name__ == "__main__":
    main()
