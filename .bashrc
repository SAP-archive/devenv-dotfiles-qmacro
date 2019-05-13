export JAVA_HOME=~/local/sapjvm_8
export PS1="\u@\h:\w \n=> "
export PATH=~/local/bin:~/local/scripts:$JAVA_HOME/bin:$PATH
export EDITOR=vim


# Colourise the ls output, need to use different
# parameters depending on platform (macOS doesn't
# use --color=auto)
alias ls="ls --color=auto"
if [[ `uname` == "Darwin" ]]; then
	alias ls="ls -FG"
else
	alias ls="ls --color=auto"
fi

# Point ranger to different config dir
alias ranger="ranger -r ~/local/scripts/ranger/"
alias r="ranger"

# Google Cloud SDK
if [ -f ~/google-cloud-sdk/path.bash.inc ]; then source ~/google-cloud-sdk/path.bash.inc; fi
if [ -f ~/google-cloud-sdk/completion.bash.inc ]; then source ~/google-cloud-sdk/completion.bash.inc; fi

#[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Node Version Manager
export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# For bash-git-prompt (see https://github.com/magicmonty/bash-git-prompt)
GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_SHOW_UPSTREAM=1
[ -e ~/.bash-git-prompt/gitprompt.sh ] && source ~/.bash-git-prompt/gitprompt.sh

# Turn on vi mode in bash, and ensure I can still use Ctrl-L to clear screen
set -o vi
bind -x '"\C-l": clear'

# Set shortcuts
[ -e "$HOME/local/scripts/bash.shortcuts" ] && source "$HOME/local/scripts/bash.shortcuts"

# Experiment with fzf
source "$HOME/local/scripts/fzfutils.sh"

export LP=${HOME}/local/projects

# Add all the dirs and subdirs in .scripts to the PATH.
# See https://github.com/LukeSmithxyz/voidrice/blob/master/.scripts/SCRIPTS.md
export PATH=$(du $HOME/.scripts | cut -f2 | tr '\n' ':'):$PATH

# Use "code" to invoke "code-insiders" if present, otherwise "code"
CI=`which code-insiders`
export CODE=${CI:-`which code`}

