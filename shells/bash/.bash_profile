# .bash_profile

# User specific environment settings and startup programs

unset PATH

PATH=:$HOME/bin:$HOME/.local/bin:\
  /bin:/usr/bin:/sbin:/usr/sbin:\
  /usr/local/bin:/usr/local/sbin:/usr/games:\
  /usr/X11/bin:/usr/bin/X11:/usr/X11R6/bin

# NetBSD pkgsrc installs to /usr/pkg/{bin,sbin} by default
if [ $(uname) = "NetBSD" ];
then
  PATH=${PATH}:/usr/pkg/bin:/usr/pkg/sbin
fi

export PATH

# Don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# Do not append any of these commands to history file
export HISTIGNORE="pwd:ls:ls -l:ls -a:ls -la:history:pass"

# Bigger history PLEASE!
export HISTSIZE=100000
export HISTFILESIZE=100000

###### Colored MAN pages ######
# From: http://tuxarena.blogspot.com/2009/06/6-bash-productivity-tips.html

export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box 
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# Make ls, du, df etc report sizes in a human-readable way by default.
export BLOCKSIZE=human-readable

# Export a proper editor.
if   command -v vim   1>/dev/null; 
then 
  export EDITOR='vim'
elif command -v vi    1>/dev/null; 
then 
  export EDITOR='vi'
elif command -v emacs 1>/dev/null; 
then 
  export EDITOR='emacs -nw'
else 
  echo 'Install a proper editor.'
fi

# Set a default URL when starting w3m without one.
export WWW_HOME="https://duckduckgo.com"

# Source individual per-interactive-shell startup file
if [ -e $HOME/.bashrc ]; then
    source $HOME/.bashrc
fi
