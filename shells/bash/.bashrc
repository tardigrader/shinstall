# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

# Check if we've got w3m or any other text-based web browser.
if $(type -P w3m >/dev/null 2>&1); then
  export TEXTBROWSER="$(type -P w3m)"
elif $(type -P lynx >/dev/null 2>&1); then
  export TEXTBROWSER="$(type -P lynx)"
else
    export TEXTBROWSER=""
fi

####### PROMPT ########

# Set a nice prompt
if [ -e "$HOME/.bash.d/bash_prompt_colors" ]; then
    source $HOME/.bash.d/bash_prompt_colors
    export PROMPT_DIRTRIM=1
    export PS1="\[$txtylw\][\A]\[$txtcyn\][\u@\h]:\[$txtgrn\] \w-\$\[\e[0m\]> "
fi


# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    color_prompt=yes
    ;;
*)
    ;;
esac

# Enable completion of hostnames.
shopt -s hostcomplete

# Enable completion for pass
if [ -e /usr/share/bash-completion/completions/pass ];
then
  source /usr/share/bash-completion/completions/pass
fi


echo "------------------------------------------------------------------------------"
echo -n "Logged on at "
date
echo -n "You are now connected to $(hostname -s)"
SSH_IP="$(echo ${SSH_CLIENT%% *})"

if [ "$SSH_IP" ]; then
  echo " via an encrypted connection from $SSH_IP"   # SSH connection
else
  echo " via an unencrypted connection."             # NOT an SSH connection
fi
echo "Your shell is $SHELL"
echo "------------------------------------------------------------------------------"
echo

####### ALIASES ######################################################
#
# Alias definitions.
#
# All common aliases goes in ~/.bash.d/bash_aliases
# But also check for aliases in $HOME/.aliases.
#
######################################################################

if [ -e "$HOME/.bash.d/bash_aliases" ];
then
  echo "Sourcing $HOME/.bash.d/bash_aliases."
  source "$HOME/.bash.d/bash_aliases"
  echo "$(grep -c alias $HOME/.bash.d/bash_aliases) aliases added."
  echo "Total command aliases: $(alias | wc -l | sed 's/ //g')."
  echo "------------------------------------------------------------------------------"
elif [ -e "$HOME/.aliases" ];
then
  echo "Sourcing $HOME/.aliases."
  source "$HOME/.aliases"
  echo "$(grep -c alias $HOME/.aliases) aliases added."
  echo "Total command aliases: $(alias | wc -l | sed 's/ //g')."
  echo "------------------------------------------------------------------------------"
else
  echo "No alias file to be sourced."
fi

if hash pom 2>/dev/null;
then
  pom
fi
echo
echo "Happy, UNIXing!"

#END of .bashrc
