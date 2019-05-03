bindkey -e

autoload colors
colors
PROMPT="%{${fg[green]}%}%(!.#.$) %{${reset_color}%}"

export PATH="$HOME/.gitim/bin:$PATH"
export FPATH="$HOME/.zsh/autoload/:$FPATH"

source ~/.rc/.*

# export PATH="$HOME/eco/bin:$PATH"
source $HOME/eco/.eco

dome() { source /usr/local/bin/dome $@ }

alias pblast=pbcopy_lastcommand

# zle
for file in $(find ~/zle/widgets -type f); do source "$file"; done
source ~/zle/bindkey

alias pbcopy="gtee >(/usr/bin/env pbcopy)"
alias p="gtee >(/usr/bin/env pbcopy)"

gistnow() { source /usr/bin/env gistnow }

# pyenv
# Too heavy to init
# eval "$(pyenv init -)"

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

export LSCOLORS=gxfxbxdxcxegedabagacad
zstyle ':completion:*' list-colors $LSCOLORS

# PROMPT
RPROMPT="%1(v|%F{green}%1v%f|) [%~]"
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
function precmd_vcs() {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
precmd_functions+=(precmd_vcs)

# COLORING
export LSCOLORS=gxfxbxdxcxegedabagacad
alias ls="ls -aFG"
zstyle ':completion:*' list-colors $LSCOLORS

autoload colors
colors
PROMPT="%{${fg[green]}%}%(!.#.$) %{${reset_color}%}"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="$HOME/.gitim:$PATH"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yuma/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/yuma/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/yuma/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/yuma/google-cloud-sdk/completion.zsh.inc'; fi
