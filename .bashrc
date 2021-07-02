# Great Practical Ideas for Computer Scientists
# Sample .bashrc file

# We provide a few (useful) aliases and scripts for you to get started:

### afsperms <arguments to fs sa> -- Recursively runs fs sa on a directory
### cc <arguments to gcc> -- Invokes gcc with the flags you will usually use
### valgrind-leak <arguments to valgrind> -- Invokes valgrind in the mode to show all leaks
### hidden <arguments to ls> -- Displays ONLY the hidden files
### killz <program name> -- Kills all programs with the given program name
### shell -- Displays the name of the shell being used
### get_cs_afs_access -- Sets up cross-realm authentication with CS.CMU.EDU so you can access files stored there.

# More features may be added later as thought of or requested.

# Move to the last saved working directory if one exists
# if [ -e ~/.last_cd ]
# then
#   cd $(cat ~/.last_cd)
# fi

# ----- guard against non-interactive logins ---------------------------------
# If not running interactively, don't do anything
# [ -z "$PS1" ] && return


# ----- convenient alias and function definitions ----------------------------

# color support for ls and grep
alias grep='grep --color=auto'
if [[ `uname` = "Darwin" || `uname` = "FreeBSD" ]]; then
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi

alias killz='killall -9 '
alias hidden='ls -a | grep "^\..*"'
alias rm='rm -v'
alias cp='cp -v'
alias mv='mv -v'
alias shell='ps -p $$ -o comm='
alias sml='rlwrap sml'
alias math='rlwrap MathKernel'
alias coin='rlwrap coin'
alias ocaml='rlwrap ocaml'

alias cc='gcc -Wall -W -ansi -pedantic -O2 '
alias valgrind-leak='valgrind --leak-check=full --show-reachable=yes'

# afsperms(){ find $1 -type d -exec fs sa {} $2 $3 \; ; }
# get_cs_afs_access() {
#     # Script to give a user with an andrew.cmu.edu account access to cs.cmu.edu
#     # See https://www.cs.cmu.edu/~help/afs/cross_realm.html for information.
#
#     # Get tokens. This might create the user, but I'm not sure that that's
#     # reliable, so we'll also try to do pts createuser.
#     aklog cs.cmu.edu
#
#     pts createuser $(whoami)@ANDREW.CMU.EDU -cell cs.cmu.edu 2>&1 | grep -v "Entry for name already exists"
#
#     aklog cs.cmu.edu
#
#     echo "Be sure to add aklog cs.cmu.edu & to your ~/.bashrc"
# }


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

# Enable programmable completion features
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

bind "set completion-ignore-case on"

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe.sh ] && export LESSOPEN="|/usr/bin/lesspipe.sh %s"

# Turn off the ability for other people to message your terminal using wall
mesg n


# ----- change the prompt ----------------------------------------------------

parse_git_branch() {
  if [ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ]; then
    echo " ($(git symbolic-ref --quiet --short HEAD || git rev-parse --short HEAD))"
  else
    ""
  fi
}

# It's really fun to customize your prompt.
# Give it a try! See man bash for help
# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
PS1="\`if [ \$? = 0 ]; then echo \[\e[33m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\` \t|\u@\h:\w\\[\033[33m\]\$(parse_git_branch)\[\033[00m\]$ "

# ----- GPI-specific configuration -------------------------------------------
# source ~/.bashrc_gpi
# export PATH=$PATH:/afs/andrew/course/15/122/bin:~/bin

# Allow saving of current directory between sessions
# logged_cd () {
#   cd "$@"
#   pwd > ~/.last_cd
# }

# alias "cd"="logged_cd" # Keep track of most recent directory

# PATH="${PATH}:/afs/andrew/course/15/150/bin"; export PATH

# function runrm() {
#     python /afs/cs.cmu.edu/academic/class/15251-s16/rmprogramming/runrm.pyc $@
# }

# PATH="${PATH}:/afs/cs/academic/class/15210-f16/mlton-spoonhower/build/bin/"; export PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
