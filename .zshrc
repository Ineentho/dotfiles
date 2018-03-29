
alias vim=nvim
alias cb='xclip -selection c'

alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/henrik/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#

export EDITOR=vim

autoload -Uz colors && colors
PROMPT="%{$fg[blue]%}%m %{$fg_no_bold[yellow]%}%1~ %{$reset_color%}%# "
RPROMPT="%?%"

_preexec() {
	cmd_timestamp=$EPOCHSECONDS

	# shows the current dir and executed command in the title when a process is active
	print -Pn "\e]0;"
	echo -nE "$PWD:t: $2"
	print -Pn "\a"    
}

_precmd() {
    # shows the full path in the title
	print -Pn '\e]0;%~\a'
}

#export COLORTERM="gnome-terminal"
#export TERM=xterm-256color

autoload -Uz add-zsh-hook
autoload -Uz vcs_info

add-zsh-hook preexec _preexec
add-zsh-hook precmd _precmd

autoload -U select-word-style                 1
select-word-style bash

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

print -Pn "\e]0;$POST_RC_TITLE\a"
fc -R
eval "$POST_RC"

export NVM_DIR="/home/henrik/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -U edit-command-line
# Emacs style
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line


eval "$RUN"
