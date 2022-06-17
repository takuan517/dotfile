# git-promptの読み込み
source ~/.zsh/git-prompt.sh

# git-completionの読み込み
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
autoload -Uz compinit && compinit

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

if [[ "$USER" == "takuan" ]]
then
    # If I am takuan
    # ```
    # 00:00:00 hostname:~
    # $
    # ```
    export PROMPT=$'%{\e[01;34m%}%*%{\e[00m%} %{\e[01;32m%}%m:%~%{\e[00m%}\n$ '
elif [[ "$USER" == "root" ]]
then
    # If I am root
    # ```
    # 00:00:00 root@hostname:~  # <- red color
    # $
    # ```
    export PROMPT=$'%{\e[01;34m%}%*%{\e[00m%} %{\e[01;33m%}$USER@%(!.%{\e[01;31m%}.%{\e[01;32m%})%m:%~%{\e[00m%}\n$ '
else
    # Other
    # ```
    # 00:00:00 hoge@hostname:~  # <- green color
    # $
    # ```
    export PROMPT=$'%{\e[01;34m%}%*%{\e[00m%} %{\e[01;33m%}$USER@%(!.%{\e[01;31m%}.%{\e[01;32m%})%m:%~%{\e[00m%}\n$ '
fi

# alias
alias la='ls -al'
alias dcp="docker compose"
alias gp="git push"
alias gc="git commit"
alias ga="git add"

# Automatically start tmux session on ssh
if [[ -n "$PS1" ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_CONNECTION" ]] && [[ "$LC_TERMINAL" == "iTerm2" ]] && which tmux >> /dev/null
then
    start_tmux() { tmux -CC attach || tmux -CC; }
    exec start_tmux
fi

# anyenv for mac
# eval "$(/opt/homebrew/bin/brew shellenv)"
# export PATH="$HOME/.anyenv/bin:$PATH"
# eval "$(anyenv init -)"
