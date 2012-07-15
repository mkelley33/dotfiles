export SSH_ENV=$HOME/.ssh/environment

# Exec this line to see (.) hidden files in MacVim open dialog.
# defaults write org.vim.MacVim AppleShowAllFiles 1

function start_agent {
  /usr/bin/ssh-agent > ${SSH_ENV}
  chmod 600 ${SSH_ENV}
  . ${SSH_ENV} > /dev/null
  /usr/bin/ssh-add;
}

# Source SSH settings, if applicable
. ${SSH_ENV} > /dev/null
ps -x | grep "^ *${SSH_AGENT_PID}" | grep ssh-agent$ > /dev/null || {
  start_agent;
}

export PATH="/usr/local/bin:/usr/local/mysql/bin:/Applications:${PATH}"
alias subl='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl'
#export EDITOR='mvim -f'
export EDITOR='subl -w'
export VISUAL='mvim -f'
export MYVIMRC='~/.vimrc'
alias vim='mvim -v'

export HISTCONTROL=ignoreboth 
export HISTSIZE=10000

alias duh='du -cms * | sort -rn'
alias ll="ls -lahF"
alias cpip="ifconfig \
| grep en1 -A1 \
| grep -Eo 'inet\ [1-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' \
| cut -c 6- \
| xargs -I {} echo {}:'3000' \
| pbcopy"
alias cpdate="date|pbcopy"
alias cptime="date +'%r'|pbcopy"
alias cpsdate="date +'%Y-%m-%d'|pbcopy"
alias kcmd="echo '⌘'|pbcopy"
alias kshift="echo '⇧'|pbcopy"
alias kopt="echo '⌥'|pbcopy"

# Useful for when you need to SSH into a server and want to edit some files
# using vim but don't want to screw up spacing consistency.
# :set ts=2 sw=2 expandtab ai | pbcopy"

alias lss="ls -lahF"
# Run tests specifying that test environment be used.
alias stt="rake RAILS_ENV=test"

source ~/.bashrc
source ~/.git-completion.bash
