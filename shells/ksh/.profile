# $OpenBSD: dot.profile,v 1.5 2018/02/02 02:29:54 yasuoka Exp $
#
# sh/ksh initialization

export ENV=$HOME/.kshrc
export LC_ALL=sv_SE.UTF-8

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games

# Set the default permissions                                         #
umask 0077

# Colorized ls output, used by colorls
export CLICOLOR=true 

# History
export HISTFILE=$HOME/.ksh_history
export HISTSIZE=10000
# Ignore duplicate commands and those beginning with space.
export HISTCONTROL=ignoredups:ignorespace 

# Fix the prompt
export PS1="\h(\s-!):\w\$ "

# Set a default URL when starting w3m without one.
WWW_HOME="https://duckduckgo.com/lite"

export EDITOR=vim
export PATH HOME TERM
