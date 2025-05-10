case $- in
  *i*) ;;
    *) return;;
esac

## setting up auto-integration with bash
if [ -n "${GHOSTTY_RESOURCES_DIR}" ]; then
    builtin source "${GHOSTTY_RESOURCES_DIR}/shell-integration/bash/ghostty.bash"
fi

export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=10000
export HISTFILESIZE=20000
shopt -s histappend

export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

bind -x '"\C-f": tmux-sessionizer'
bind -x '"\C-o": pdf-fzf'
bind -x '"\C-e": source /data/env/bin/activate && clear'

## Aliases
alias ll='ls -lah --color=auto'
alias la='ls -A --color=auto'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history 1 | sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias tex-fzf='tex-template-fzf'

# SSH and Compile flags
export SSH_KEY_PATH="~/.ssh/rsa_id"
export ARCHFLAGS="-arch x86_64"

## Vim as a life-style
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
    alias vi='vim'
else
    export EDITOR=nvim
    alias vi='nvim'
fi

# Cargo setup
export PATH=$HOME/.cargo/bin:$PATH
# Zig setup
export PATH=$HOME/.zig/build/stage3/bin:$PATH
# Ghostty setup
export PATH=$HOME/.ghostty/zig-out/bin:$PATH

# CUDA setup
export CUDA_PATH=/opt/cuda
export PATH=$CUDA_PATH/bin:$PATH
export LD_LIBRARY_PATH=$CUDA_PATH/lib64:$LD_LIBRARY_PATH
export CPATH=$CUDA_HOME/include:$CPATH
export LIBRARY_PATH=$CUDA_HOME/lib64:$LIBRARY_PATH

# cuDNN setup
export CUDNN_PATH=/usr/lib
export LD_LIBRARY_PATH=$CUDNN_PATH:$LD_LIBRARY_PATH

# NVIDIA Visual Profiler
alias nvp='nvvp -vm /usr/lib/jvm/java-8-openjdk/jre/bin/java'

# NVM setup
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

# JAVA setup
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
export PATH=$JAVA_HOME/bin:$PATH

# maven setup
export MVN_HOME=/opt/apache-maven-3.9.4/
export PATH=$MVN_HOME/bin:$PATH

# Setting up scripts
PATH="$PATH:$HOME/.local/scripts/"
