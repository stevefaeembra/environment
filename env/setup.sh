#!/bin/bash

rm $HOME/.bashrc_mark-small \
   $HOME/.vimrc \
   $HOME/.inputrc \
   $HOME/.zshrc

ln -s $HOME/.environment/env/bashrc_mark-small $HOME/.bashrc_mark-small
ln -s $HOME/.environment/env/vimrc $HOME/.vimrc
ln -s $HOME/.environment/env/inputrc $HOME/.inputrc
ln -s $HOME/.environment/env/zshrc $HOME/.zshrc
ln -s $HOME/.environment/env/msmall-agnoster.zsh-theme $HOME/.oh-my-zsh/themes/msmall-agnoster.zsh-theme

