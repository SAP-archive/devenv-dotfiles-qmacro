export JAVA_HOME=~/local/sapjvm_8
export PS1="\u@\h:\w \n=> "
export PATH=~/local/bin:~/local/scripts:$JAVA_HOME/bin:$PATH
export EDITOR=vim

# Load the shell dotfiles
for file in ~/.{path,exports,aliases}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;


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

export LP=${HOME}/local/projects

# Add all the dirs and subdirs in .scripts to the PATH.
# See https://github.com/LukeSmithxyz/voidrice/blob/master/.scripts/SCRIPTS.md
export PATH=$(du $HOME/.scripts | cut -f2 | tr '\n' ':'):$PATH

# Use "code" to invoke "code-insiders" if present, otherwise "code"
CI=`which code-insiders`
export CODE=${CI:-`which code`}
alias code=$CODE


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#envinfo | lolcat 2>/dev/null

export FZF_DEFAULT_COMMAND='fd --hidden --exclude .git .'

# Get timestamps added to bash history
export HISTTIMEFORMAT="%y-%m-%d %T "

# Don't search inside node_modules dir
#export GREP_OPTIONS='--exclude-dir=node_modules'

# Append to history on every command and don't empty
# the history file on exit. See:
# https://superuser.com/questions/788428/how-to-port-my-current-bash-history-over-when-opening-a-tmux-session
export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
shopt -s histappend

# Source my functions in the scripts dir
source ~/.scripts/functions.bash

# Don't exit on Ctrl-D
set -o ignoreeof

# Automatically start or attach to a core tmux session
if [ "$TERM" != "screen-256color" ]; then
	tmux attach -t "$USER" || tmux new -s "$USER"
fi

# Tmuxinator - source completion logic
source $HOME/.scripts/tmuxinator.completion.bash
