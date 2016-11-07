echo 'you read .zshrc'

# Aliases
alias b='bundle'
alias e='exec'
alias be='bundle exec'
alias r='bundle exec rails'
alias rspec='bundle exec rspec'
alias rubocop='bundle exec rubocop'
alias i18n-tasks='bundle exec i18n-tasks'
alias g='git'
alias locale='i18n-tasks'
alias p='pbcopy'
alias sed='gsed'
alias date='gdate'
alias ll='ls -lah'

# http://subtech.g.hatena.ne.jp/secondlife/20091020/1256008337
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

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
HISTSIZE=2500
SAVEHIST=2500
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_no_store
setopt share_history
setopt auto_pushd
setopt pushd_ignore_dups
set paste

alias history='history -1000'

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

RPROMPT="%1(v|%F{green}%1v%f|)"


