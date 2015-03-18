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
ZSH_THEME='clean'
plugins=(git)
. $ZSH/oh-my-zsh.sh


function tddd63 {
	. ~/py/env/bin/activate
	cd ~/py/maps
}

function corona {
	cd ~/corona-sdk/
	./corona.sh | grep -v 'Using default font.'
}


function _update_ps1() {
	export PS1="$(python2 ~/powerline-shell.py $? 2> /dev/null)"
}


xhost +local:root > /dev/null 2>&1

alias mntnas='sudo mount -t nfs 192.168.1.72:/DataVolume/Public/ /mnt/nas'
alias monoff='sleep .01; xset dpms force off'
alias bcorona=". ~/py/auto/bin/activate; python ~/lif-quiz/bin/build.py"
alias clip='xclip -selection clipboard'
alias sd='shutdown now'
alias sida='ssh henka368@astmatix.ida.liu.se'
alias ida='echo henka368@astmatix.ida.liu.se'
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
alias idea='intellij-idea-ultimate-edition'
# alias chromium='chromium --audio-buffer-size=2048'
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
    esac else
    echo "'$1' is not a valid file"
  fi
}

alias cb='xclip -selection c'



export CLASSPATH=/home/ineentho/junit
export TERM=rxvt-unicode
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
