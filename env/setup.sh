#!/bin/bash

rm -rf $HOME/.bashrc_mark-small \
       $HOME/.emacs \
       $HOME/.emacs.d \
       $HOME/.gitconfig \
       $HOME/.git-templates \
       $HOME/.gitignore \
       $HOME/.vimrc \
       $HOME/.inputrc \
       $HOME/.zshrc \
       $HOME/.fonts \
       $HOME/.oh-my-zsh/themes/msmall-agnoster.zsh-theme

ln -s $HOME/.environment/env/bashrc_mark-small $HOME/.bashrc_mark-small
ln -s $HOME/.environment/env/emacs $HOME/.emacs
ln -s $HOME/.environment/env/emacs.d $HOME/.emacs.d
ln -s $HOME/.environment/env/gitconfig $HOME/.gitconfig
ln -s $HOME/.environment/env/git-templates $HOME/.git-templates
ln -s $HOME/.environment/env/gitignore $HOME/.gitignore
ln -s $HOME/.environment/env/vimrc $HOME/.vimrc
ln -s $HOME/.environment/env/inputrc $HOME/.inputrc
ln -s $HOME/.environment/env/zshrc $HOME/.zshrc
ln -s $HOME/.environment/env/fonts $HOME/.fonts
ln -s $HOME/.environment/env/msmall-agnoster.zsh-theme $HOME/.oh-my-zsh/themes/msmall-agnoster.zsh-theme

