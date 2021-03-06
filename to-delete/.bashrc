#echo '.bashrc reading'
##################################################################

# See following for more information: http://www.infinitered.com/blog/?p=19

## Read mechine depend external .bashrc ----------------------------------

if [ -f ~/.bashrc_init ]; then
    . ~/.bashrc_init
fi

## Variable --------------------------------------------------------------
export SCALA_HOME="$HOME/opt/local/scala-2.11.2/bin"  #TODO move this into .bashrc_init_light ?

## Tool ------------------------------------------------------------------
export editor_main=mvim

## Path ------------------------------------------------------------------

## @NOTE: reverse order: the last one will be prepended to the path
##
PATH="$HOME/script/bin2":$PATH
PATH="$HOME/script/bin":$PATH
PATH="$HOME/bin":$PATH
##
## @NOTE: normal order: the last one will be appended to the path
##
PATH=$PATH:"$HOME/opt/local/scala-2.11.2/bin"   #TODO move this into .bashrc_init_light ?
PATH=$PATH:"$HOME/opt/local/adt-bundle-mac-x86_64-20140702/sdk/platform-tools"
PATH=$PATH:"$HOME/opt/devtools/autotools-bin/bin"
export PATH

## Usefull --------------------------------------------------------
export DT=$HOME/Desktop/



# Colors ----------------------------------------------------------
#export TERM=xterm-color
#/ comment out the above apprently it is causing tmux to overwrite instead of insert
#/ https://groups.google.com/forum/#!topic/tmux-users/HcKnBs5uJds
#/ http://unix.stackexchange.com/questions/1045/getting-256-colors-to-work-in-tmux

#export TERM=xterm-256color
#/ Do not set TERM in shell configuration.
#/ Your terminal (OSX Terminal) should set TERM, this should not be done in the shell.
#/ http://superuser.com/questions/234922/what-should-term-be-on-mac-osx-10-6-6
#/ http://unix.stackexchange.com/questions/139082/zsh-set-term-screen-256color-in-tmux-but-xterm-256color-without-tmux

export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1

alias ls='ls -G'            #/ OS-X SPECIFIC - the -G command in OS-X is for colors, in Linux it's no groups
#alias ls='ls --color=auto' #/ For linux, etc

#/ ls colors, see: http://www.linux-sxs.org/housekeeping/lscolors.html
#export LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rb=90'  #LS_COLORS is not supported by the default ls command in OS-X

#/ Setup some colors to use later in interactive shell or scripts
export COLOR_NC='\e[0m' # No Color
export COLOR_WHITE='\e[1;37m'
export COLOR_BLACK='\e[0;30m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_CYAN='\e[0;36m's
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_GRAY='\e[1;30m'
export COLOR_LIGHT_GRAY='\e[0;37m'
alias colorslist="set | egrep 'COLOR_\w*'"  # Lists all the colors, uses vars in .bashrc_non-interactive



#/ Misc -------------------------------------------------------------
export HISTCONTROL=ignoredups
shopt -s checkwinsize # After each command, checks the windows size and changes lines and columns

#/ bash completion settings (actually, these are readline settings)
bind "set completion-ignore-case on" # note: bind used instead of sticking these in .inputrc
bind "set bell-style none" # no bell
bind "set show-all-if-ambiguous On" # show list automatically, without double tab

#/ Turn on advanced bash completion if the file exists (get it here: http://www.caliban.org/bash/index.shtml#completion)
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi



#/ Prompts ----------------------------------------------------------
# export PS1="\[${COLOR_GREEN}\]\w > \[${COLOR_NC}\]"  # Primary prompt with only a path
# export PS1="\[${COLOR_GRAY}\]\u@\h \[${COLOR_GREEN}\]\w > \[${COLOR_NC}\]"  # Primary prompt with user, host, and path
export PS1="\[${COLOR_GREEN}\]\w
$ \[${COLOR_NC}\]"
# This runs before the prompt and sets the title of the xterm* window.  If you set the title in the prompt
# weird wrapping errors occur on some systems, so this method is superior
#export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*} ${PWD}"; echo -ne "\007"'  # user@host path
export PROMPT_COMMAND='echo -ne "\033]0;${PWD}"; echo -ne "\007"'  # user@host path

export PS2='> '    # Secondary prompt
export PS3='#? '   # Prompt 3
export PS4='+'     # Prompt 4

function xtitle {  # change the title of your xterm* window
  unset PROMPT_COMMAND
  echo -ne "\033]0;$1\007"
}


# Editors ----------------------------------------------------------
#export EDITOR='mate -w'  # OS-X SPECIFIC - TextMate, w is to wait for TextMate window to close
#export EDITOR='gedit'  #Linux/gnome
#export EDITOR='vim'  #Command line


# set up ssh-agent -------------------------------------------------------
SSH_ENV=$HOME/.ssh/environment

# start the ssh-agent
function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add
}

if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

## Use Vim mode ----------------------------------------------------------
set -o vi



## X11 -------------------------------------------------------------------
#/ do not use the following on osx
# xrdb -merge ~/.Xresources
# xrdb ~/.Xresources


#/ try to fix to first xterm session display 'â' (unsuccessfully)
# LANG=en_US


## terminal color mapping ------------------------------------------------
export CLICOLOR=1
#/ use this for black background
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
#/ use this for white background
# export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
#/ ref: http://apple.stackexchange.com/questions/33677/how-can-i-configure-mac-terminal-to-have-color-ls-output



## Environment for git-diffc----------------------------------------------

export TMPDIR=~/tmp    # location of temp folder
export CLEANUP=0                     # don't clean up
#      [note] DO NOT SET GIT_EXTERNAL_DIFF. IF YOU DO git-diffc WILL NOT WORK


## color for Less --------------------------------------------------------
export LESS=-RFX


## Read external aliases -------------------------------------------------

if [ -f ~/.bashrc_device ]; then
    . ~/.bashrc_device
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


if [ -f ~/.bash_aliases_device ]; then
    . ~/.bash_aliases_device
fi



##################################################
#echo '.bashrc reading done'

