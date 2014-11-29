#!/bin/zsh

# zsh
zstyle :compinstall filename '/home/ineentho/.zshrc'
autoload -Uz compinit
compinit
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v


# oh-my-zsh
export ZSH=$HOME/dotfiles/oh-my-zsh
ZSH_THEME='af-magic'
plugins=(git)
. $ZSH/oh-my-zsh.sh


function tddd63 {
	. ~/py/env/bin/activate
	cd ~/py/maps
}

function corona {
	cd ~/corona-sdk/
	./corona.sh
}


function _update_ps1() {
	export PS1="$(python2 ~/powerline-shell.py $? 2> /dev/null)"
}

#export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"

if [ -f /etc/bash_completion ]; then
	    . /etc/bash_completion
fi

xhost +local:root > /dev/null 2>&1

alias bcorona=". ~/py/auto/bin/activate; python ~/lif-quiz/bin/build.py"
alias clip='xclip -selection clipboard'
alias sd='shutdown now'
alias sida='ssh henka368@astmatix.ida.liu.se'
alias si='ssh ineentho.com'
alias corona='wine ~/corona-sdk/Corona\ Simulator.exe'
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano PKGBUILD'

# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# prompt
#PS1='[\u@\h \W]\$ '
#BROWSER=/usr/bin/xdg-open
alias cb='xclip -selection c'


. ~/dotfiles/prompt.zsh
