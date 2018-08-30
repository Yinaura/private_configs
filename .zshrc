indkey -e

# PROMPT
RPROMPT="%1(v|%F{green}%1v%f|) [%~]"

autoload colors
colors
PROMPT="%{${fg[green]}%}%(!.#.$) %{${reset_color}%}"

for file in $(find ~/zle/widgets -type f); do source "$file"; done
source ~/zle/bindkey

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

for file in $(find $HOME/.pb4human/lib -type f); do source "$file"; done # pb4human
