# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f /home/twhite/.bash_aliases ]; then
	. /home/twhite/.bash_aliases
fi
# User specific aliases and functions
alias ls='ls --color'

