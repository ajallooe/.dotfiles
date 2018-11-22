#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Start rbenv
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"

# Add homebrew to the completion path
fpath=("/usr/local/bin/" $fpath)

# why would you type 'cd dir' if you could just type 'dir'?
setopt AUTO_CD

# Now we can pipe to multiple outputs!
setopt MULTIOS

# This makes cd=pushd
setopt AUTO_PUSHD

# This will use named dirs when possible
setopt AUTO_NAME_DIRS

# If we have a glob this will expand it
setopt GLOB_COMPLETE
setopt PUSHD_MINUS

# No more annoying pushd messages...
# setopt PUSHD_SILENT

# blank pushd goes to home
setopt PUSHD_TO_HOME

# this will ignore multiple directories for the stack.  Useful?  I dunno.
setopt PUSHD_IGNORE_DUPS

# 10 second wait if you do something that will delete everything.  I wish I'd had this before...
setopt RM_STAR_WAIT

# use magic (this is default, but it can't hurt!)
setopt ZLE

setopt NO_HUP

# only fools wouldn't do this ;-)
# export EDITOR="subl -n -w"
export EDITOR="vim"

setopt IGNORE_EOF

# If I could disable Ctrl-s completely I would!
setopt NO_FLOW_CONTROL

# Keep echo "station" > station from clobbering station
setopt NO_CLOBBER

# Case insensitive globbing
setopt NO_CASE_GLOB

# Be Reasonable!
setopt NUMERIC_GLOB_SORT

# I don't know why I never set this before.
setopt EXTENDED_GLOB

# hows about arrays be awesome?  (that is, frew${cool}frew has frew surrounding all the variables, not just first and last
setopt RC_EXPAND_PARAM

# Who doesn't want home and end to work?
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line

# Incremental search is elite!
bindkey -M vicmd "/" history-incremental-search-backward
bindkey -M vicmd "?" history-incremental-search-forward

# Search based on what you typed in already
bindkey -M vicmd "//" history-beginning-search-backward
bindkey -M vicmd "??" history-beginning-search-forward

bindkey "\eOP" run-help

# oh wow!  This is killer...  try it!
bindkey -M vicmd "q" push-line

# it's like, space AND completion.  Gnarlbot.
bindkey -M viins ' ' magic-space

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true

### Old oh-my-zsh configs

# Look in ~/.oh-my-zsh/themes/
## Optionally, if you set this to "random", it'll load a random theme each
## time that oh-my-zsh is loaded.
#ZSH_THEME="ajallooe"

## Uncomment the following line to use case-sensitive completion.
## CASE_SENSITIVE="true"

## Uncomment the following line to use hyphen-insensitive completion. Case
## sensitive completion must be off. _ and - will be interchangeable.
## HYPHEN_INSENSITIVE="true"

## Uncomment the following line to disable bi-weekly auto-update checks.
## DISABLE_AUTO_UPDATE="true"

## Uncomment the following line to change how often to auto-update (in days).
## export UPDATE_ZSH_DAYS=13

## Uncomment the following line to disable colors in ls.
## DISABLE_LS_COLORS="true"

## Uncomment the following line to disable auto-setting terminal title.
## DISABLE_AUTO_TITLE="true"

## Uncomment the following line to enable command auto-correction.
## ENABLE_CORRECTION="true"

## Uncomment the following line to display red dots whilst waiting for completion.
## COMPLETION_WAITING_DOTS="true"

## Uncomment the following line if you want to disable marking untracked files
## under VCS as dirty. This makes repository status check for large repositories
## much, much faster.
## DISABLE_UNTRACKED_FILES_DIRTY="true"

## Uncomment the following line if you want to change the command execution time
## stamp shown in the history command output.
## The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
## HIST_STAMPS="mm/dd/yyyy"

## Would you like to use another custom folder than $ZSH/custom?
## ZSH_CUSTOM=/path/to/new-custom-folder

## Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
## Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
## Example format: plugins=(rails git textmate ruby lighthouse)
## Add wisely, as too many plugins slow down shell startup.
#plugins=(git)

## User configuration

#export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/texbin"
## export MANPATH="/usr/local/man:$MANPATH"

#source $ZSH/oh-my-zsh.sh

## You may need to manually set your language environment
## export LANG=en_US.UTF-8

## Preferred editor for local and remote sessions
## if [[ -n $SSH_CONNECTION ]]; then
##   export EDITOR='vim'
## else
##   export EDITOR='mvim'
## fi

## Compilation flags
## export ARCHFLAGS="-arch x86_64"

## ssh
## export SSH_KEY_PATH="~/.ssh/dsa_id"

## Set personal aliases, overriding those provided by oh-my-zsh libs,
## plugins, and themes. Aliases can be placed here, though oh-my-zsh
## users are encouraged to define aliases within the ZSH_CUSTOM folder.
## For a full list of active aliases, run `alias`.
##
## Example aliases
## alias zshconfig="mate ~/.zshrc"
## alias ohmyzsh="mate ~/.oh-my-zsh"

#export EDITOR="vim"
#bindkey -v 
#bindkey -M viins ‘jj’ vi-cmd-mode

## vi style incremental search
#bindkey '^R' history-incremental-search-backward
#bindkey '^S' history-incremental-search-forward
#bindkey '^P' history-search-backward
#bindkey '^N' history-search-forward 

export LSCOLORS="ExFxCxDxBxegedabagacad"


# Base16 Shell
BASE16_SCHEME="ocean"
BASE16_SHELL="$HOME/.dotfiles/base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

source $HOME/.dotfiles/base16-shell/scripts/base16-ocean.sh

source ~/.dotfiles/alias

settitle() {
    printf "\033k$1\033\\"
}
ssh() {
    settitle "$*"
    command ssh "$@"
    settitle "zsh"
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
