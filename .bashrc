# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
/usr/bin/setxkbmap -option "ctrl:nocaps"

PATH=$PATH:$HOME/.rvm/bin:/etc/alternatives

alias kat="RAILS_RELATIVE_URL_ROOT=/katello rails server thin"
alias rh_vpn="sudo openvpn --config ~/ovpn-phx2-tcp-x86-64.conf"

# oracle vs linux -> verdict: oracle sucks
# export JDK_HOME=/usr/java/jdk1.7.0_40
# export JAVA_HOME=/etc/alternatives/java

export HISTSIZE=100000
export TERM=xterm-256color
export EDITOR=vim
export VISUAL=vim

# Save each command as it's executed instead of at the end of a session.
# Since, $PROMPT_COMMAND already existed, we're not going to overwrite it,
# rather we append to it.
export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

# http://github.com/aziz/tmuxinator
#source $HOME/bin/tmuxinator.bash

# Append instead of overwriting bash_history
shopt -s histappend

alias gst="git status"
