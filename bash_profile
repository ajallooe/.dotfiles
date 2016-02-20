#!/bin/bash

# Editor

export EDITOR="vim"

# Upgraded ls

alias ls='ls -GFh'
alias rm='rm -i'

# Setting path

homebrew=/usr/local/bin:/usr/local/sbin
export PATH=$homebrew:$PATH

export ARCHFLAGS=-Wno-error=unused-command-line-argument-hard-error-in-future

export PATH="/Users/ajallooe/settings:$PATH" 
#export PYTHONPATH=/usr/local/lib/python3.4/site-packages:/usr/local/lib/python2.7/site-packages:$PYTHONPATH

function is_in {
  local list="$1"
  local item="$2"
  if [[ $list =~ (^|[[:space:]])"$item"($|[[:space:]]) ]] ; then
    result=0
  else
    result=1
  fi
  return $result
}
export -f is_in

export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s" # for OSX
# export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s" # for Linux
export LESS=' -R '
# requires source-highlight

alias emacs="/usr/local/Cellar/emacs/24.4/Emacs.app/Contents/MacOS/Emacs -nw"

# Handy shortcuts

alias ll='ls -GFlh'

alias txe="open -a TextEdit"
alias txm="open -a TextMate"
alias zth="zathura"
# alias st="open /Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl"

alias ssoh="ssh ohaton"
function scoh { ssh ohaton "tar -cjf \"$1\"" | tar -xvjf; }
export -f scoh

alias ssif="ssh innisfree"
function scif { ssh innisfree "tar -cjf \"$1\"" | tar -xvjf; }
export -f scif

alias ssch="ssh innisfree -t \"ssh chinook\""
function scch { ssh innisfree -t "ssh chinook \"tar -cjf \"$1\" \"" | tar -xvjf; }
export -f scch

alias sscn="ssh chinook"
function scif { ssh innisfree "tar -cjf \"$1\"" | tar -xvjf; }
export -f scif

function ssth { ssh innisfree -t "ssh chinook -t \"ssh \"$1\"\""; }
export -f ssth
function scth { ssh innisfree -t "ssh chinook -t \"ssh \"$1\" \"tar -cjf \"$2\" \"\"" | tar -xvjf; }
export -f scth

function sstc { ssh chinook -t "ssh \"$1\""; }
export -f sstc
function sctc { ssh innisfree -t "ssh \"$1\" \"tar -cjf \"$2\" \"" | tar -xvjf; }
export -f sctc

alias ssgb="sstc gamebuilder"
function scgb { sctc gamebuilder "$1"; }
export -f scgb

alias ssfc="sstc fire-creek"
function scfc { sctc fire-creek "$1"; }
export -f scfc

alias ssfp="sstc fire-point"
function scfp { sctc fire-point "$1"; }
export -f scfp

function sccsn { scp "$1" innisfree:/cshome/ajallooe/copystore/; }
export -f sccsn

alias cdwk="cd /Users/ajallooe/work"
alias cdfg="cd /Users/ajallooe/work/Research/Go/Fuego/"
alias cdex="cd /Users/ajallooe/work/exp/fuego/experiments"
alias exfg="/Users/ajallooe/work/Research/Go/Fuego/fuegomain/fuego"


# Terminal colors

export
PS1="\n0----+----1----+----2----+----3----+----4----+----5----+----6----+----7----+----\n\[\033[91m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[93m\]\w\[\033[m\] [\[\033[95m\]\D{%Y-%m-%d}\[\033[m\]::\[\033[95m\]\t\[\033[m\]]\n\$ "
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
