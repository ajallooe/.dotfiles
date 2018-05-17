# needed for virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/work
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export PIP_REQUIRE_VIRTUALENV=true
source /usr/local/bin/virtualenvwrapper.sh
#if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ] && [ "$dist" == "Ubuntu" ] ; then
    #export PATH="$HOME/.pyenv/bin:$PATH"    
    #eval "$(pyenv init -)"
    #eval "$(pyenv virtualenv-init -)"
#fi
