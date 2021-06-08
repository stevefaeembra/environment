#!/bin/bash

#mv $HOME/.bashrc $HOME/.bashrc.orig

# Generate SSH Key
cat /dev/zero | ssh-keygen -q -N ""

# Generate GPG keyring
cat >foo <<EOF
     %echo Generating a basic OpenPGP key
     Key-Type: default
     Key-Length: 2048
     Subkey-Type: default
     Name-Real: Mark Small
     Name-Comment: with stupid passphrase
     Name-Email: marksmall@gmx.com
     Expire-Date: 0
     Passphrase: abc
     # Do a commit here, so that we can later print "done" :-)
     %commit
     %echo done
EOF
gpg --batch --generate-key foo
rm -rf foo

# Setup oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Setup static files.
# Delete existing files
rm -rf $HOME/.profile\
       $HOME/.bashrc \
       $HOME/.bashrc_mark-small \
       $HOME/.bashrc_as\
       $HOME/.emacs \
       $HOME/.emacs.d \
       $HOME/.gitconfig \
       $HOME/.gitmessage \
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

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Recreate from configured.
ln -s $DIR/profile $HOME/.profile
ln -s $DIR/bashrc $HOME/.bashrc
ln -s $DIR/bashrc_mark-small $HOME/.bashrc_mark-small
ln -s $DIR/bashrc_as $HOME/.bashrc_as
ln -s $DIR/emacs $HOME/.emacs
ln -s $DIR/emacs.d $HOME/.emacs.d
ln -s $DIR/gitconfig $HOME/.gitconfig
ln -s $DIR/gitmessage $HOME/.gitmessage
ln -s $DIR/gitignore $HOME/.gitignore
ln -s $DIR/vimrc $HOME/.vimrc
ln -s $DIR/inputrc $HOME/.inputrc
ln -s $DIR/zshrc $HOME/.zshrc
ln -s $DIR/shell_aliases $HOME/.shell_aliases
ln -s $DIR/shell_secrets $HOME/.shell_secrets
ln -s $DIR/fonts $HOME/.fonts
ln -s $DIR/k5login $HOME/.k5login
ln -s $DIR/msmall-agnoster.zsh-theme $HOME/.oh-my-zsh/themes/msmall-agnoster.zsh-theme
ln -s $DIR/m2 $HOME/.m2
ln -s $DIR/tmux.conf $HOME/.tmux.conf
ln -s $DIR/ackrc $HOME/.ackrc
ln -s $DIR/config $HOME/.ssh/config

# Setup pathogen for vim.
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

## Add vim plugins
cd ~/.vim/bundle
git clone git://github.com/altercation/vim-colors-solarized.git
git clone git://github.com/tpope/vim-sensible.git

# Add TMUX Plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Add Node Version manager
git clone https://github.com/nodenv/nodenv.git ~/.nodenv
# Add node-build plugin for ndenv
mkdir -p ~/.nodenv/plugins
git clone https://github.com/nodenv/node-build.git ~/.nodenv/plugins/node-build

chsh `whoami` -s /bin/zsh
