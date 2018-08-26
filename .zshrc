bindkey -e

# PROMPT
RPROMPT="%1(v|%F{green}%1v%f|) [%~]"

source ~/.rc/.*
source ~/.ccc

# zle
source ~/zle/widgets/peco-select-history-up
bindkey '^R' peco-select-history-up

source ~/zle/widgets/incremental-select-command-history
#bindkey '^[[A' incremental-select-command-history
bindkey '^E' incremental-select-command-history

source ~/zle/widgets/up-refreshed-history
bindkey '^[[A' up-refreshed-history

# pyenv
eval "$(pyenv init -)"

# For use brew opensssl
export PATH=/usr/local/opt/openssl/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/opt/openssl/lib:$LD_LIBRARY_PATH
export CPATH=/usr/local/opt/openssl/include:$LD_LIBRARY_PATH

# go
[[ -s ~/.gvm/scripts/gvm ]] && . ~/.gvm/scripts/gvm

# direnv
eval "$(direnv hook zsh)"
export EDITOR=vim

# rbenv binstubs setting
export PATH=./vendor/bin:/Users/yinaura/google-cloud-sdk/bin:$PATH

# Other 
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

PATH=${PATH}
export LANG=en_US.UTF-8

autoload -U compinit
compinit

zstyle ':completion:*' ignore-parents parent pwd ..

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_no_store
setopt share_history
setopt auto_pushd
setopt pushd_ignore_dups
set paste

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end


export LSCOLORS=gxfxbxdxcxegedabagacad
alias ls="ls -aFG"
zstyle ':completion:*' list-colors $LSCOLORS

autoload colors
colors
PROMPT="%{${fg[green]}%}%(!.#.$) %{${reset_color}%}"

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
function precmd_vcs() {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
precmd_functions+=(precmd_vcs)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

