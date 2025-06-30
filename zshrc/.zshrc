# history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# options
unsetopt beep
# bindkey -v

# comp
# zstyle :compinstall filename '/home/keb/.zshrc'
# autoload -Uz compinit
# compinit

# aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias c='clear'
alias '..'='cd ..'
alias vim=nvim

lfcd () {
    # `command` is needed in case `lfcd` is aliased to `lf`
    cd "$(command lf -print-last-dir "$@")"
}

# prompt
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
PROMPT=' %F{blue}%~%f %F{red}${vcs_info_msg_0_}%F{green}> %f'

# plugins
ZPLUGINDIR=${ZDOTDIR:-$HOME/.config/zsh}/plugins

function plugin-clone {
  local repo plugdir initfile initfiles=()
  ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/zsh}/plugins}
  for repo in $@; do
    plugdir=$ZPLUGINDIR/${repo:t}
    initfile=$plugdir/${repo:t}.plugin.zsh
    if [[ ! -d $plugdir ]]; then
      echo "Cloning $repo..."
      git clone -q --depth 1 --recursive --shallow-submodules https://github.com/$repo $plugdir
    fi
    if [[ ! -e $initfile ]]; then
      initfiles=($plugdir/*.{plugin.zsh,zsh-theme,zsh,sh}(N))
      (( $#initfiles )) && ln -sf $initfiles[1] $initfile
    fi
  done
}

function plugin-source {
  local plugdir initfile
  ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/zsh}/plugins}
  for plugdir in $@; do
    [[ $plugdir = /* ]] || plugdir=$ZPLUGINDIR/$plugdir
    fpath+=$plugdir
    initfile=$plugdir/${plugdir:t}.plugin.zsh
    (( $+functions[zsh-defer] )) && zsh-defer . $initfile || . $initfile
  done
}

repos=(
  belak/zsh-utils

  zsh-users/zsh-completions
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-history-substring-search # TODO: fzf history search

  zdharma-continuum/fast-syntax-highlighting
)
plugin-clone $repos

plugins=(
  zsh-completions
  zsh-autosuggestions
  zsh-utils/completion
  fast-syntax-highlighting
)
plugin-source $plugins

compstyle ohmyzsh

eval "$(zoxide init --cmd cd zsh)"

if [ -z "$TMUX" ]
then
    tmux new-session -A -s main
fi


# TODO: dont put this here...
export EDITOR="vim"
export VISUAL="nvim"
export SUDO_EDITOR="nvim"
export READER="zathura"
export TERMINAL="foot"
export BROWSER="firefox"
export VIDEO="mpv"
# export IMAGE="sxiv"
export COLORTERM="truecolor"
export OPENER="xdg-open"
export PAGER="less"
export WM="sway"
# export LAUNCHER="tofi"
