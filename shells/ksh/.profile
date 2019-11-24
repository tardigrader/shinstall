# $OpenBSD: dot.profile,v 1.5 2018/02/02 02:29:54 yasuoka Exp $
#
# sh/ksh initialization

# Colors for prompt
BLACK='\033[0;30m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
RED='\033[0;31m'
PURPLE='\033[0;35m'
BROWN='\033[0;33m'
RESET='\033[00m'

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
GIT_BRANCH="git branch 2>/dev/null | grep '^*' | colrm 1 2"
export PS1="${GREEN}(\s-!)${RESET}${RED}[\$(${GIT_BRANCH})]${RESET}${CYAN} \w ${RESET}\n╰─▶ @\h$ "

#export PS1="\h(\s-!):\w\$ "

# Set a default URL when starting w3m without one.
export WWW_HOME="https://duckduckgo.com/lite"

# CVS
if [ "$(uname)" = "OpenBSD" ];
then
  export CVSROOT=anoncvs@anoncvs.eu.openbsd.org:/cvs
fi

export EDITOR=vim
export PATH HOME TERM
