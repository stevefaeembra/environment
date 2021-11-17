#!/bin/bash

#mv $HOME/.bashrc $HOME/.bashrc.orig

# Generate SSH Key
#cat /dev/zero | ssh-keygen -q -N ""

# Generate GPG keyring
#cat >foo <<EOF
#     %echo Generating a basic OpenPGP key
#     Key-Type: default
#     Key-Length: 2048
#     Subkey-Type: default
#     Name-Real: Mark Small
#     Name-Comment: with stupid passphrase
#     Name-Email: marksmall@gmx.com
#     Expire-Date: 0
#     Passphrase: abc
#     # Do a commit here, so that we can later print "done" :-)
#     %commit
#     %echo done
#EOF
#gpg --batch --generate-key foo
#rm -rf foo

# Setup oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Setup static files.
# Delete existing files
rm -rf $HOME/.profile\
       $HOME/.bashrc \
       $HOME/.gitconfig \
       $HOME/.gitmessage \
       $HOME/.gitignore \
       $HOME/.vimrc \
       $HOME/.inputrc \
       $HOME/.zshrc \
       $HOME/.fonts \
       $HOME/.oh-my-zsh/themes/msmall-agnoster.zsh-theme \
       $HOME/.tmux.conf \
       $HOME/.ssh/config

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Recreate from configured.
ln -s $DIR/profile $HOME/.profile
ln -s $DIR/bashrc $HOME/.bashrc
ln -s $DIR/gitconfig $HOME/.gitconfig
ln -s $DIR/gitmessage $HOME/.gitmessage
ln -s $DIR/gitignore $HOME/.gitignore
ln -s $DIR/vimrc $HOME/.vimrc
ln -s $DIR/inputrc $HOME/.inputrc
ln -s $DIR/zshrc $HOME/.zshrc
ln -s $DIR/shell_aliases $HOME/.shell_aliases
ln -s $DIR/shell_secrets $HOME/.shell_secrets
ln -s $DIR/fonts $HOME/.fonts
ln -s $DIR/msmall-agnoster.zsh-theme $HOME/.oh-my-zsh/themes/msmall-agnoster.zsh-theme
ln -s $DIR/tmux.conf $HOME/.tmux.conf
ln -s $DIR/config $HOME/.ssh/config

# Setup pathogen for vim.
#mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

## Add vim plugins
#cd ~/.vim/bundle
#git clone git://github.com/altercation/vim-colors-solarized.git
#git clone git://github.com/tpope/vim-sensible.git

# Add TMUX Plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Add Node Version manager
git clone https://github.com/nodenv/nodenv.git ~/.nodenv
# Add node-build plugin for ndenv
mkdir -p ~/.nodenv/plugins
git clone https://github.com/nodenv/node-build.git ~/.nodenv/plugins/node-build

# set up personal theme (optional)
cp ~/themes/punctual.zsh-theme  ~/.oh-my-zsh/custom/themes/punctual.zsh-theme

# Add pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
cd ~/.pyenv && src/configure && make -C src && cd -

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init --path)"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc

cd ~/.pyenv/plugins/python-build/../.. && git pull && cd -

git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc

chsh `whoami` -s /bin/zsh
