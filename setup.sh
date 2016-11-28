#! /usr/bin/bash
# source this file
ln -sf `pwd`/.bashrc ~
ln -sf `pwd`/.vimrc ~
ln -sf `pwd`/.vim ~
vim +PlugInstall +qa
source ~/.bashrc
