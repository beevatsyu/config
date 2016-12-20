#! /bin/bash
# source this file
if [ -f ~/.bashrc ]; then
	cp ~/.bashrc ~/.bashrc.old
fi
ln -sf `pwd`/.bashrc ~

if [ -f ~/.vimrc ]; then
	cp ~/.vimrc ~/.vimrc.old
fi
ln -sf `pwd`/.vimrc ~

if [ -d ~/.vim ]; then
	cp -r ~/.vim ~/.vim.old
fi
ln -sf `pwd`/.vim ~

vim +PlugInstall +qa
source ~/.bashrc
