#!/usr/bin/env bash

#cd ~
#git clone https://github.com/ajallooe/.dotfiles.git
#cd .dotfiles

if [ "$(uname)" == "Darwin" ] ; then
    # install command line tools
    xcode-select --install

    # install XCode
    sudo xcodebuild -license

    # install Google Chrome

    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    brew install macvim --with-override-system-vim
    brew install zsh tmux
    brew cask install iterm2
    brew install cmake ctags git fasd autojump

    git config --global credential.helper osxkeychain

    mkdir ~/.zprezto

    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

    zsh

    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
      ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done

    sh -s /bin/zsh

    # to update:
    # git pull && git submodule update --init --recursive

    ln -s ~/.dotfiles/zprezto/ ~/.zprezto
    ln -s ~/.dotfiles/vimrc ~/.vimrc
    ln -s ~/.dotfiles/zshrc ~/.zshrc
    ln -s ~/.dotfiles/zshenv ~/.zshenv
    ln -s ~/.dotfiles/zpreztorc ~/.zpreztorc
    ln -s ~/.dotfiles/zprofile ~/.zprofile
    ln -s ~/.dotfiles/zlogin ~/.zlogin
    ln -s ~/.dotfiles/zlogout ~/.zlogout
    #ln -s ~/.dotfiles/bashrc ~/.bashrc
    ln -s ~/.dotfiles/bash_profile ~/.bash_profile
    ln -s ~/.dotfiles/tmux.conf ~/.tmux.con
    #ln -s ~/.dotfiles/Xresources ~/.Xresources
    ln -s ~/.dotfiles/gitconfig ~/.gitconfig
    #ln -s ~/.dotfiles/emacs ~/.emacs
    ln -s ~/.dotfiles/profile ~/.profile
    ln -s ~/.dotfiles/secrets ~/.secrets
    ln -s ~/.dotfiles/zprezto ~/.zprezto

    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    git clone https://github.com/chriskempson/base16-iterm2 ~/.iterm2/base16

    vim +PluginInstall +qall

    cd ~/.vim/bundle/YouCompleteMe
    ./install.py --clang-completer
    cd ~/.dotfiles

    brew install gdb ssh-copy-id wget watch source-highlight ag reattach-to-user-namespace

    brew install python
    brew install python@2
    python3 -c "import ssl; print(ssl.OPENSSL_VERSION)"
    python2 -c "import ssl; print(ssl.OPENSSL_VERSION)"
    pip3 install --upgrade pip setuptools wheel
    pip2 install --upgrade pip setuptools wheel
    pip3 install virtualenv virtualenvwrapper
    pip2 install virtualenv virtualenvwrapper
    source ~/.profile
    brew install qt5
    brew install sip
    brew install pyqt5
    brew cask install qt-creator
    brew install pkg-config libpng freetype
    brew tap caskroom/fonts
    brew cask install font-input font-source-code-pro
    mkvirtualenv --python=/usr/local/bin/python3 sci
    pip3 install numpy scipy matplotlib pandas sympy nose
    pip3 install jupyter
    pip3 install ipython[all]
    pip3 install pandoc
    #jupyter qtconsole --ConsoleWidget.font_family="Source Code Pro" --ConsoleWidget.font_size=14
    pip3 install tensorflow
    #brew install --python --qt vtk
    3brew install wxmac
    #brew install zmq
    #pip install pylab
    #pip install networkx
    #pip install configobj
    #pip install envisage
    #pip install mayavi

    #brew install pyenv pyenv-virtualenv pyenv-virtualenvwrapper
    #pyenv install 2.7.10
    #pyenv install 3.5.0

    brew cask install java firefox zotero keepassx sublime-text
    brew install emacs --with-cocoa

    brew cask install shiftit

    # install vimperator
    # install JDK

    brew cask install textmate eclipse-ide xmind libreoffice

    brew cask install mactex texshop latexit

    #brew cask install tunnelblick seil
    brew install dos2unix
    brew cask install xquartz caffeine atom flux karabiner-elements
    brew cask install vlc alfred little-snitch transmit
    brew cask alfred link
    brew cask install thefuck
    apm install sync-settings

    brew install gnuplot --with-x11

    brew install doxygen

    #brew install homebrew/games/gnu-go homebrew/games/go-gui homebrew/games/fuego
    brew install gnu-go go-gui fuego

    brew install ghc
    brew install cabal-install
    cabal update

    # install Chromecast
    # install Adobe Reader
    brew cask install adobe-acrobat-reader
    brew cask install google-backup-and-sync skype telegram-desktop google-chrome
    # install Google Drive App
    # install Dropbox App
    # install Alberta Cisco AnyConnect

    #brew cask install skype google-drive
    brew cask install dropbox flash-player
    brew cask install github-desktop sourcetree
    #brew cask install viber electric-sheep

    brew cask install xscreensaver


    ln -s ~/.dotfiles/sshconfig ~/.ssh/config
    if [ -z ${DISPLAY} ]
    then
      export DISPLAY=:0.0
    fi
    brew linkapps
    brew cleanup

    # install Input Mono, Set iTerm, MacVim font

    # Generate Ctags
    # ctags -R .

    open iTermColorsToTerminalColors.swift

    #install tensorflow with bazel
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ] && [ "$dist" == "Ubuntu" ] ; then
    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get dist-upgrade
    sudo add-apt-repository ppa:pgolm/the-silver-searcher
    sudo add-apt-repository ppa:webupd8team/sublime-text-3
    sudo add-apt-repository ppa:caffeine-developers/ppa
    sudo add-apt-repository ppa:nilarimogard/webupd8
    sudo apt-get update
    sudo apt-get install build-essential make
    sudo apt-get install gnome-shell
    sudo apt-get install chromium-browser
    sudo apt-get install vim-gnome
    sudo apt-get install zsh tmux git subversion
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
    sudo apt-get install cmake exuberant-ctags autojump
    git clone https://github.com/clvv/fasd.git ~/Downloads/fasd
    cd ~/Downloads/fasd/; sudo make install; cd ..; rm -rf fasd

    zsh

    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
      ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done

    sh -s /bin/zsh

    # to update:
    # git pull && git submodule update --init --recursive

    ln -s ~/.dotfiles/zprezto/ ~/.zprezto
    ln -s ~/.dotfiles/vimrc ~/.vimrc
    ln -s ~/.dotfiles/zshrc ~/.zshrc
    ln -s ~/.dotfiles/zshenv ~/.zshenv
    ln -s ~/.dotfiles/zpreztorc ~/.zpreztorc
    ln -s ~/.dotfiles/zprofile ~/.zprofile
    ln -s ~/.dotfiles/zlogin ~/.zlogin
    ln -s ~/.dotfiles/zlogout ~/.zlogout
    ln -s ~/.dotfiles/bashrc ~/.bashrc
    ln -s ~/.dotfiles/tmux.conf ~/.tmux.con
    ln -s ~/.dotfiles/Xresources ~/.Xresources
    ln -s ~/.dotfiles/gitconfig ~/.gitconfig
    ln -s ~/.dotfiles/emacs ~/.emacs
    ln -s ~/.dotfiles/profile ~/.profile
    ln -s ~/.dotfiles/secrets ~/.secrets

    cd ~/.dotfiles
    git clone https://github.com/chriskempson/base16-iterm2.git

    sudo apt-get install libgnome-keyring-dev
    cd /usr/share/doc/git/contrib/credential/gnome-keyring
    sudo make
    git config --global credential.helper /usr/share/doc/git/contrib/credential/gnome-keyring/git-credential-gnome-keyring

    sudo apt-get install python-dev python3-dev

    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    vim +PluginInstall +qall

    cd ~/.vim/bundle/YouCompleteMe
    ./install.py --clang-completer
    cd ~/.dotfiles

    git clone https://github.com/chriskempson/base16-gnome-terminal
    ~/.config/base16-gnome-terminal
    source .config/base16-gnome-terminal/base16-ocean.dark.sh

    brew install wget source-highlight the-silver-searcher xclip

    sudo apt-get install python-numpy python-scipy python-dev python-pip
    python-nose g++ libopenblas-dev gdb
    sudo pip install matplotlib
    sudo apt-get install zeromq
    pip install pylab
    pip install ipython
    pip install notebook
    pip install virtualenv virtualenvwrapper

    sudo apt-get install -y build-essential libssl-dev zlib1g-dev
    libbz2-dev libreadline-dev libsqlite3-dev curl llvm
    curl -L
    https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | zsh
    pyenv install 2.7.10
    pyenv install 3.5.0

    brew cask install default-jdk firefox
    wget https://raw.github.com/smathot/zotero_installer/master/zotero_installer.sh -O /tmp/zotero_installer.sh
    chmod +x /tmp/zotero_installer.sh
    /tmp/zotero_installer.sh
    sudo apt-get install keepassx
    sudo apt-get install sublime-text-installer
    sudo apt-get install emacs

    # install vimperator
    # install JDK

    sudo apt-get install eclipse libreoffice
    wget http://www.xmind.net/xmind/downloads/xmind-7-update1-linux_amd64.deb -O ~/Downloads/xmind.deb
    sudo dpkg -i ~/Downloads/xmind.deb
    rm -f ~/Downloads/xmind.deb

    sudo apt-get install texlive texstudio

    sudo apt-get install network-manager-openvpn caffeine dos2unix
    wget https://github.com/atom/atom/releases/download/v1.6.2/atom-amd64.deb -O ~/Downloads/atom.deb
    sudo dpkg -i ~/Downloads/atom.deb
    rm -f ~/Downloads.atom.deb
    sudo apt-get install gnuplot-x11

    sudo apt-get install gnugo
    # install GoGui, Fuego

    sudo apt-get install ghc
    sudo apt-get install cabal-install
    cabal update

    # install Chromecast
    # install Chrome Apps
    # install Adobe Reader
    # install Google Drive App
    # install Dropbox App

    sudo apt-get install grive
    # install skype, dropbox flash-player adobe-reader electric-sheep

    sudo apt-get install xscreensaver


    ln -s ~/.dotfiles/sshconfig ~/.ssh/config
    if [ -z ${DISPLAY} ]
    then
      export DISPLAY=:0.0
    fi

    # install input mono, Set gnome-terminal, gvim font

    # Generate Ctags
    # ctags -R .

    #install tensorflow with bazel

fi
