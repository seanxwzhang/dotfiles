#!/usr/bin/env python
# This script installs my dotfiles to the ~ directory
import shutil
import os
import errno
import time

ITEMS = [
    ".vimrc",
    ".vim",
    ".vim_runtime",
    ".zsh",
    ".zshrc",
    ".zshrc.pre-oh-my-zsh",
    ".oh-my-zsh",
    ".tmux.conf",
    ".tmux.conf.local"
]

SCD = "https://github.com/pavoljuhas/smart-change-directory.git"
ZSH = "https://github.com/zsh-users/zsh-syntax-highlighting.git"

def mkdir_p(path):
    try:
        os.makedirs(path)
    except OSError as exc:  # Python >2.5
        if exc.errno == errno.EEXIST and os.path.isdir(path):
            pass
        else:
            raise

def install():
    scriptPath = os.path.realpath(__file__)
    dirPath = os.path.dirname(scriptPath)
    homePath = os.path.expanduser('~')
    srcPath = os.join(homePath, 'src')
    localPath = '/usr/local/share'
    archivePath = os.path.join(dirPath, 'archive/' + time.strftime('%Y/%m/%d/%H-%M-%S'))
    print('Archiving current dotfiles in %s' % archivePath)
    mkdir_p(os.path.join(archivePath))
    for item in ITEMS:
        itemDest = os.path.join(homePath, item)
        itemSrc = os.path.join(dirPath, item)
        print("installing %s" % item)
        if os.path.exists(itemDest):
            shutil.move(itemDest, archivePath)
        os.symlink(itemSrc, itemDest)
    if not os.path.exists(os.path.join(srcPath, 'smart-change-directory')):
        os.system('git clone %s %s' % (SCD, srcPath))
    if not os.path.eixist(os.path.join(localPath, 'zsh-syntax-highlighting')):
        os.system('git clone %s %s' % (ZSH, localPath))
    return

if __name__ == "__main__":
    install()

