set -o vi

case $- in
  *i*) ;;
    *) return;;
esac

export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=10000
export HISTFILESIZE=20000
shopt -s histappend

export PATH="$HOME/.local/scripts/:$PATH"

bind -x '"\C-f": tmux-sessionizer'
bind -x '"\C-o": pdf-fzf'

alias ll='ls -lah --color=auto'
alias la='ls -A --color=auto'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history 1 | sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias tex-fzf='tex-template-fzf'

export SSH_KEY_PATH="~/.ssh/rsa_id"
export ARCHFLAGS="-arch x86_64"

export EDITOR=nvim
alias vi='nvim'

eval "$(starship init bash)"
command -v direnv >/dev/null && eval "$(direnv hook bash)"
