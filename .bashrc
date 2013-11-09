# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
/usr/bin/setxkbmap -option "ctrl:nocaps"

PATH=$PATH:$HOME/.rvm/bin:/etc/alternatives

alias kat-thin="RAILS_RELATIVE_URL_ROOT=/katello rails server thin"
alias kat-wr=""
alias kat-pdn="cd ~/notes/projects/katello && vim primary-dev-notes.mdown"
alias kat-kre="cd ~/projects/katello-reports-engine/"

alias rh_vpn="sudo openvpn --config ~/ovpn-phx2-tcp-x86-64.conf"

# oracle vs linux -> verdict: oracle sucks
# export JDK_HOME=/usr/java/jdk1.7.0_40
# export JAVA_HOME=/etc/alternatives/java

export HISTSIZE=100000
export HISTCONTROL=ignoredups:ignorespace
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
alias gco="git checkout"

# redcarpet, pygments.rb throw many UTF-8 conversion errors without this.
# redcarpet still throws one: unable to convert "\xD0" from ASCII-8BIT to UTF-8 for lib/redcarpet.so, skipping
# see SO post: http://stackoverflow.com/questions/4975973/gem-update-unable-to-convert-xe7-to-utf-8-in-conversion-from-ascii-8bit-to-u
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8
unset LC_ALL

alias dotfiles="cd ~/projects/dotfiles"
