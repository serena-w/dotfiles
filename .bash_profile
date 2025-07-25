# ----- shell settings and completion -------------------------------------

# Make .bash_history store more and not store duplicates
export HISTCONTROL=ignoreboth
export HISTSIZE=250000
export HISTFILESIZE=250000

# Append to the history file, don't overwrite it
shopt -s histappend

# Check the window size after each command and, if necessary,
# Update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Enable autocompletion features from Homebrew
if type brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [[ -r "$COMPLETION" ]] && source "$COMPLETION"
    done
  fi
fi

bind "set completion-ignore-case on"

# Make your terminal prompt show what git branch you're on
. /usr/local/etc/bash_completion.d/git-completion.bash
. /usr/local/etc/bash_completion.d/git-prompt.sh

# Make the prompt look like this:-
# Mon Apr 02 12:06:50 ~/code/airbnb (master) $
export PS1="\`if [ \$? = 0 ]; then echo \[\e[33m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\` \[\033[01;32m\]\d \t \w\$(__git_ps1) \[\033[00m\]\$ "

export EDITOR=vim

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
source ~/.bashrc

eval "$(/opt/homebrew/bin/brew shellenv)"
