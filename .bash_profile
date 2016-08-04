# Make your terminal prompt show what git branch you're on
. /usr/local/etc/bash_completion.d/git-completion.bash
. /usr/local/etc/bash_completion.d/git-prompt.sh

# Make the prompt look like this:-
# Mon Apr 02 12:06:50 ~/code/airbnb (master) $
export PS1="\`if [ \$? = 0 ]; then echo \[\e[33m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\` \[\033[01;32m\]\d \t \w\$(__git_ps1) \[\033[00m\]\$ "

export NVM_DIR="/Users/serena_wang/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export EDITOR=vim

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
