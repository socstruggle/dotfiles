if [ -f ~/bash_aliases ]; then
	. ~/bash_aliases
fi
shopt -s histappend
HISTSIZE=
HISTFILESIZE=
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n> '
PROMPT_COMMAND="history -a $HISTFILE; $PROMPT_COMMAND"
