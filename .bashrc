#--------------------------
#    Lonyelon's .bashrc	   
#--------------------------

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize

export PS1="\[\033[38;5;2m\][\[$(tput sgr0)\]\[\033[38;5;10m\]\u@\h:\[$(tput sgr0)\]\[\033[38;5;12m\]\w\[$(tput sgr0)\]\[\033[38;5;10m\]]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"

for sh in /etc/bash/bashrc.d/*.bashrc ; do
	[[ -r ${sh} ]] && source "${sh}"
done

[ -f ~/.aliases ] && ~/.aliases

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

# Variables
export LANG=es_ES.UTF-8
export EDITOR='nvim'
export BROWSER='qutebrowser'
# export ARCHFLAGS="-arch x86_64"

# Include aliases
source ~/.aliases

# Autostart x
[[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]] && startx

# Flex
neofetch
cat /etc/motd 2>/dev/null

#icons
export LF_ICONS="\
tw=📁:\
st=📁:\
ow=📁:\
dt=📁:\
di=📁:\
fi=F:\
ln=📁:\
or=📁:\
ex=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.nix=:\
"
