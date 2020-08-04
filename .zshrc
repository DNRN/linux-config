
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' max-errors 1 numeric
zstyle :compinstall filename '/home/dnrn/.zshrc'

autoload -Uz compinit
compinit


powerline-daemon -q
. /usr/lib/python3.8/site-packages/powerline/bindings/zsh/powerline.zsh


# Prompt themes
autoload -Uz promptinit
promptinit

# Git info
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
precmd() {
    vcs_info
}

zstyle ':vcs_info:git*' formats "%{$fg[grey]%}%s %{$reset_color%}%r/%S%{$fg[grey]%} %{$fg[blue]%}%b%{$reset_color%}%m%u%c%{$reset_color%} "



# Enable colors and change prompt:
# autoload -U colors && colors
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# PS1="[%n@%M %~]$ "

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -e

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Hash dirs
hash -d holo=~/projects/hololink/services
hash -d ysi=~/projects/YSI/services

# Alias
alias ..="cd .."

# copy content from file to clipfolder
alias cf="xclip -sel c"

alias vim=nvim
alias sa="eval '$(ssh-agent -s)' && ssh-add ~/.ssh/id_rsa"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/nvm/init-nvm.sh
