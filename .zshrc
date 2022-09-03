if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# increase history
HISTSIZE=500000000
setopt incappendhistory
setopt histignoredups
setopt extendedhistory

# prompt
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:*' formats '(%F{magenta}%b%f)'
setopt prompt_subst
PS1=$'%F{magenta}%n%f@%m %F{gray}%~${vcs_info_msg_0_}\n%f%# '

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$HOME/.cargo/bin:$HOME/.local/bin:$PATH"
# set GPG_TTY for macos
export GPG_TTY="$(tty)"
# set ssh key for git
export GIT_SSH_COMMAND='ssh -i ~/.ssh/id_lratt'

alias dots="git --work-tree=$HOME --git-dir=$HOME/dotfiles.git"
alias ct="cargo test"
alias cr="cargo run"
alias cw="cargo watch"
alias ccl="cargo clippy"
alias vi="nvim"
alias vim="nvim"

# vi mode
bindkey -v

source $HOME/git/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
