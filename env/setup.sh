#!/bin/bash

mv $HOME/.bashrc $HOME/.bashrc.orig


# Setup static files.
# Delete existing files
rm -rf $HOME/.profile\
       $HOME/.bashrc \
       $HOME/.bashrc_mark-small \
       $HOME/.bashrc_as\
       $HOME/.emacs \
       $HOME/.emacs.d \
       $HOME/.gitconfig \
       $HOME/.gitignore \
       $HOME/.vimrc \
       $HOME/.inputrc \
       $HOME/.zshrc \
       $HOME/.fonts \
       $HOME/.k5login \
       $HOME/.oh-my-zsh/themes/msmall-agnoster.zsh-theme \
       $HOME/.m2 \
       $HOME/.tmux.conf \
       $HOME/.ackrc \
       $HOME/.ssh/config

# Recreate from configured.
ln -s $HOME/.environment/env/profile $HOME/.profile
ln -s $HOME/.environment/env/bashrc $HOME/.bashrc
ln -s $HOME/.environment/env/bashrc_mark-small $HOME/.bashrc_mark-small
ln -s $HOME/.environment/env/bashrc_as $HOME/.bashrc_as
ln -s $HOME/.environment/env/emacs $HOME/.emacs
ln -s $HOME/.environment/env/emacs.d $HOME/.emacs.d
ln -s $HOME/.environment/env/gitconfig $HOME/.gitconfig
ln -s $HOME/.environment/env/gitignore $HOME/.gitignore
ln -s $HOME/.environment/env/vimrc $HOME/.vimrc
ln -s $HOME/.environment/env/inputrc $HOME/.inputrc
ln -s $HOME/.environment/env/zshrc $HOME/.zshrc
ln -s $HOME/.environment/env/fonts $HOME/.fonts
ln -s $HOME/.environment/env/k5login $HOME/.k5login
ln -s $HOME/.environment/env/msmall-agnoster.zsh-theme $HOME/.oh-my-zsh/themes/msmall-agnoster.zsh-theme
ln -s $HOME/.environment/env/m2 $HOME/.m2
ln -s $HOME/.environment/env/tmux.conf $HOME/.tmux.conf
ln -s $HOME/.environment/env/ackrc $HOME/.ackrc
ln -s $HOME/.environment/env/config $HOME/.ssh/config

# Setup oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Setup pathogen for vim.
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

## Add vim plugins
cd ~/.vim/bundle
git clone git://github.com/altercation/vim-colors-solarized.git
git clone git://github.com/tpope/vim-sensible.git

# Add TMUX Plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
