# .kshrc
#

####### INPUT #######################################################
#                                                                   #
# Keyboard stuff                                                    #
#                                                                   #
#####################################################################
set -o emacs

keybd_trap () {
  case ${.sh.edchar} in
    $'OH') .sh.edchar=$'';;  # Home = beginning-of-line
    $'OF') .sh.edchar=$'';;  # End = end-of-line
    $'[3~') .sh.edchar=$'';; # Delete = delete-char
  esac
}

# Clear screen with Ctrl-L
bind -m ""="tput clear"

# Do not let ctrl-d logout,
set -o ignoreeof

######################################################################
# Fun Stuff                                                          #
######################################################################
if [ $(uname) = "OpenBSD" ] || [ $(uname) = "NetBSD" ];
then
  echo
  echo "~~~~~~ RUN BSD ~~~~~~ RUN BSD ~~~~~~ RUN BSD ~~~~~~"
fi
echo
quota
echo
echo -n "Logged on at "
date
echo -n "You are now connected to $(hostname -s)"
SSH_IP=$(echo "${SSH_CLIENT%% *}")

if [ "$SSH_IP" ]; 
then
  echo " via an encrypted connection from $SSH_IP."   # SSH connection
else
  echo " via an unencrypted connection."              # NOT an SSH connection
fi

echo
echo "Your shell is $SHELL"
echo

####### ALIASES ######################################################
#                                                                    #
# Alias definitions.                                                 #
#                                                                    #
# All common aliases goes in ~/.ksh_aliases                 #
# But also check for aliases in $HOME/.aliases.                      #
#                                                                    #
######################################################################

if [ -e "$HOME/.ksh_aliases" ];
then
  echo "Sourcing $HOME/.ksh_aliases."
  . "$HOME/.ksh_aliases"
  echo "==> $(grep -c alias $HOME/.ksh_aliases) aliases added."
  echo "==> Total command aliases: $(alias | wc -l | sed 's/ //g')."
elif [ -e "$HOME/.aliases" ];
then
  echo "Sourcing $HOME/.aliases."
  . "$HOME/.aliases"
  echo "==> $(grep -c alias $HOME/.aliases) aliases added."
  echo "==> Total command aliases: $(alias | wc -l | sed 's/ //g')."
else
  echo "No alias file to be sourced."
  echo "==> Total command aliases: $(alias | wc -l | sed 's/ //g')."
fi

echo
pom
echo
