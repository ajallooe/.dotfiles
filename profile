if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ] && [ "$dist" == "Ubuntu" ] ; then
    export PATH="$HOME/.pyenv/bin:$PATH"    
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi
