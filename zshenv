#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Editor
export EDITOR="vim"

# Setting path
homebrew=/usr/local/bin:/usr/local/sbin
export PATH=$homebrew:$PATH

export ARCHFLAGS=-Wno-error=unused-command-line-argument-hard-error-in-future

export PATH="/Users/ajallooe/settings:$PATH" 
#export PYTHONPATH=/usr/local/lib/python3.4/site-packages:/usr/local/lib/python2.7/site-packages:$PYTHONPATH

autoload -U is_in

export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s" # for OSX
#export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s" # for Linux
export LESS=' -R '

# Terminal colors
export PS1="\n\[\033[36;1m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\] \[\033[31m\]\D{%Y-%m-%d} \t\[\033[m\]\n\$ "
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export FUEGO="/Users/ajallooe/work/research/fuego/build/dbg/fuegomain/fuego"
export TWOGTP="/Users/ajallooe/work/research/gogui/gogui-1.4.9/bin/gogui-twogtp"
export GOSTAT="/Users/ajallooe/work/research/gogui/gogui-1.4.9/bin/gogui-statistics"
export GOUTIL="/Users/ajallooe/work/research/gogui/gogui-1.4.9/bin/"
export GNUGO38="/usr/local/bin/gnugo"
