# User bashrc file
# $Id: Bashrc.user 1945 2012-08-10 17:57:11Z johnb $

# Copyright (c) 2012 University of Alberta Department of Computing Science <helpdesk@cs.ualberta.ca>
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
# 
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#


# source the standard bashrc
# DON'T TOUCH THIS LINE
source /usr/local/rcfiles/Bashrc.global


# If you want to alter your path, do it like this:
#
# PATH=$PATH\:some_directories
# export PATH
# 
# The same can be done for MANPATH and INFOPATH.
# It is _STRONGLY_ recommended that you add your stuff _AFTER_ the original
# path.
#
# Stuff you might want to add:
# /usr/local/pub{bin/man/lib}
# $HOME/bin
#
# Note that most paths are architecture specific, so you should use the
# case statement below.


# If you need to do any architecture specific stuff (including *PATH stuff),
# do it within a case statement like this:
#
# ( The sysadmins have defined a variable called DISTRO, that if you
# sourced the global RC file above it should be defined. )

#case $DISTRO in
#    slackware122)  # Any machine running Slackware 12.2
#        # Slackware 12.2 stuff
#	;;
#    ubuntu1204)  # Ubuntu 12.04
#        # Ubuntu 12.04 stuff
#	;;
#    undefined)  # if something has gone wrong and DISTRO
#                # is 'undefined' then do something safe.
#	;;
#esac


# don't like emacs?  uncomment and change "emacs" to something else (like vi!)
#export EDITOR=emacs
#export VISUAL=emacs


# prompt is currently set to: user@host:currentdir>
# read the bash man page if you want to change it
#export PS1='\u@\h:\w>'


# output redirect (>) to existing files is disabled by default
# uncomment the next line to allow clobbering
# make sure you know what you are getting into!
#set +o noclobber


# Functions
# define any functions you want here


# here are the aliases we have already defined for you
# feel free to change or unalias them or define new ones
#alias mv="mv -i"
#alias cp="cp -i"
#alias rm="rm -i"
#alias mail="elm"
#alias run="source"
#alias ll="ls -l"
#alias la="ls -la"
#alias pwd='echo $PWD'
#alias md='mkdir'
#alias rd='rmdir'

# opening files
alias ']'='xdg-open'

# Upgraded ls

alias ls="ls --color=always -Fh"

# Safe rm

alias rm="rm -i"

# Setting path

export PATH=/cshome/ajallooe/scripts:$PATH

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

# Handy shortcuts
alias ll="ls --color=always -Flh"

alias ssif="ssh innisfree"
alias ssoh="ssh ohaton"
alias sscn="ssh chinook"
function sstc { ssh chinook -t \"ssh "$1"\"; }
export -f sstc
with_chinook="chinook gamebuilder fire-creek fire-point"
#alias ssgb="ssh chinook -t \"ssh gamebuilder\""
if `is_in "$with_chinook" "$hostname"` ; then
  alias ssgb="ssh gamebuilder"
  alias ssfc="ssh fire-creek"
  alias ssfp="ssh fire-point"
else
  alias ssgb="sstc gamebuilder"
  alias ssfc="sstc fire-creek"
  alias ssfp="sstc fire-point"
fi

alias cdfg="cd /cshome/ajallooe/work/Research/Go/Fuego/"
alias exfg="/cshome/ajallooe/work/Research/Go/Fuego/fuegomain/fuego"

through_chinook="gamebuilder fire-creek fire-point"
if `is_in "$through_chinook" "$hostname"` ; then
  alias cdex="cd /local/data/ajallooe/fuego/experiments"
fi

# Terminal colors
export PS1="\n\[\033[36;1m\]\u\[\033[m\]@\[\033[32m\]\h\[\033[m\]:\[\033[33;1m\]\w\[\033[m\] \[\033[31m\]\D{%Y-%m-%d} \t\[\033[m\]\n\$ "
LS_COLORS="di=1;34;40:ln=1;35;40:so=1;32;40:pi=1;31;40:ex=1;91;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"
export LS_COLORS
