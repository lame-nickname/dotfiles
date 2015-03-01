#!/bin/bash

curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

# Backup old conf files and make links to new ones
mv ~/.vimrc ~/.vimrc.backup
ln vimrc ~/.vimrc
mv ~/.tmux.conf ~/.tmux.conf.backup
ln tmux.conf ~/.tmux.conf
mv ~/.ctags ~/.ctags.backup
ln ctags ~/.ctags
mv ~/.agignore ~/.agignore.backup
ln agignore ~/.agignore
mv ~/.psqlrc ~/.psqlrc.backup
ln psqlrc ~/.psqlrc

mkdir -p ~/.vim/undo ~/.vim/backup ~/.vim/swap

# Run vim to download and install plugins
vim

# Install ctrp matcher c extension
cd ~/.vim/bundle/ctrlp-cmatcher/
./install.sh
