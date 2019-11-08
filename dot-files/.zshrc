# zmodload zsh/zprof

# Speeds up load time
DISABLE_UPDATE_PROMPT=true

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# History Settings
HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=$HISTSIZE

setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell

setopt auto_cd # cd by typing directory name if its not a command
setopt +o nomatch

autoload -U promptinit && promptinit

# User configuration
ORG_NAME='1mg'

if grep -q $ORG_NAME <<< `hostname -f`
then
	source ~/.zshrc_work
else
	source ~/.zshrc_home
fi

# aliases
alias ssh='ssh -x '
alias xx='exit'
alias zz='vim ~/.zshrc'
alias .='cd'
alias c='clear'
alias h='history'
alias r='source ~/.zshrc'

alias grep='grep -E --color=auto '
alias df='df -hPT'
alias cp='cp -av'
alias py='python '
alias dmux='bash ~/dev-tmux'

umask 0002
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
#export TERM=xterm-256color
typeset -U PATH
export PATH
# zprof

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

