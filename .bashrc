# .bashrc

# Some random color variables to make things pretty!

GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;34m\]"
RED="\[\033[0;31m\]"
NOC="\[\033[0m\]"

#Currently not using an extra alias file... but I want the syntax as a reminder

#if [ -f /Users/$USER/.bash_aliases ]; then
#	. /Users/$USER/.bash_aliases
#fi

# User specific aliases and functions

# This will probably grow over time. MAC aliases are different, change them.

if [ $(uname) == 'Darwin' ]; then
  alias ls='ls -G'
else
  alias ls='ls --color'
fi

#I hate seeing my THD computer name. Make it something not that.

if [ $HOSTNAME == 'C02WF4UXHTD6MBP' ]; then
  myhost='som'
else
  myhost=$HOSTNAME
fi

#Set the prompt red if you sudo into root

if [ $USER != 'root' ]; then
  ps1c=$GREEN
else
  ps1c=$RED
fi

#Pretty prompt. the \u is username and the \w is working directory.

PS1="$ps1c[$myhost-\u]$BLUE(\w)$NOC>"

PATH=$PATH
export PATH=$PATH:~/bin:~/local-scripts/

HISTTIMEFORMAT="%F %T: "
shopt -s histappend
HISTFILESIZE=999999
HISTSIZE=999999
HISTCONTROL=ignoreboth
export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; fi'

#PROMPT_COMMAND='history -a'
shopt -s cmdhist
shopt -s checkwinsize
