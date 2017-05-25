echo 'you read .zshrc'

# For use brew opensssl
export PATH=/usr/local/opt/openssl/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/opt/openssl/lib:$LD_LIBRARY_PATH
export CPATH=/usr/local/opt/openssl/include:$LD_LIBRARY_PATH

unalias -a

eval "$(docker-machine env default)"

# go
[[ -s ~/.gvm/scripts/gvm ]] && . ~/.gvm/scripts/gvm

# python
eval "$(pyenv init -)"

# direnv
eval "$(direnv hook zsh)"
export EDITOR=vim

bindkey -e

# Aliases
alias sub='sublime'
alias b='bundle'
alias e='exec'
alias be='bundle exec'
alias r='bundle exec rspec'
alias rspec='bundle exec rspec'
alias rubocop='bundle exec rubocop'
alias i18n-tasks='bundle exec i18n-tasks'
alias g='git'
alias locale='i18n-tasks'
alias p='pbcopy'
alias sed='gsed'
alias date='gdate'
alias cut='gcut'
alias split='gspit'
alias ll='ls -lah'
alias g='grep'
alias gore='gore -autoimport'

# http://subtech.g.hatena.ne.jp/secondlife/20091020/1256008337
#bindkey '^R' history-incremental-pattern-search-backward
#bindkey '^S' history-incremental-pattern-search-forward

# rbenv binstubs setting
export PATH=./vendor/bin:/Users/yinaura/google-cloud-sdk/bin:$PATH

# Other 
export DISABLE_COVERAGE=1
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

RPROMPT="%1(v|%F{green}%1v%f|) $PWD"

# Ctrl + r

#stty stop undef
#zle -la history-incremental-pattern-search-backward && bindkey "^r" history-incremental-pattern-search-backward
#zle -la history-incremental-pattern-search-forward  && bindkey "^s" history-incremental-pattern-search-forward

# peco
peco-select-history() {
    BUFFER=$(history 1 | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\*?\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$LBUFFER")
    CURSOR=${#BUFFER}
    zle reset-prompt
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# The next line updates PATH for the Google Cloud SDK.
source '/Users/yinaura/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/yinaura/google-cloud-sdk/completion.zsh.inc'
export PATH="$HOME/.gem/ruby/2.0.0/bin:$PATH"
# export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.5/bin:$PATH"

