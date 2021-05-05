#                                                                      DEFAULTS
###############################################################################

HISTFILE=$HOME/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
zstyle :compinstall filename '/home/lonyelon/.zshrc'
autoload -Uz compinit
compinit

#                                                                   DIRECTORIES
###############################################################################

# Cache folders
mkdir -p "$HOME/.cache/less"
mkdir -p "$HOME/.cache/zsh"
mkdir -p "$HOME/.local/share/zsh"

#                                                                     VARIABLES
###############################################################################

# Default variables
export LANG=es_ES.UTF-8
export EDITOR='nvim'
export BROWSER='qutebrowser'

# Clean up home
export PASSWORD_STORE_DIR=$HOME/.local/share/passwords
export MBSYNCRC="$HOME/.config/isync/mbsyncrc"
export INPUTRC="$HOME"/.config/readline/inputrc
export GNUPGHOME="$HOME/.local/share/gnupg"
export HISTFILE="$HOME/.local/share/zsh/history"
export NOTMUCH_CONFIG="$HOME/.config/notmuch/notmuchrc"
export NMBGIT="$HOME/.config/notmuch/nmbug"
export LESSKEY="$HOME/.config/less/lesskey"
export LESSHISTFILE="$HOME/.config/less/history"
export XINITRC="$HOME/.config/X11/xinitrc"
export XAUTHORITY="$HOME/.config/X11/Xauthority"

compinit -d "$HOME/.cache/zsh/zcompdump"

# Completion
zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/zcompcache

# Alisases
source $HOME/.config/zsh/aliases

#                                                                        BANNER
###############################################################################

# Autostart X server on boot
[[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]] && startx

# Flex
neofetch

# Show motd
lolcat -t -p 1 /etc/motd 2>/dev/null

# Check for orphans
deps="$(pacman -Qdtq | wc -l)"
[ ! "$deps" -eq 0 ] && >&2 echo "\033[31;1m[ERROR] $deps orphans found, remove them with: pacman -Rns \$(pacman -Qdtq)\033[0;0m"

# Check if miner is running
minercount="$(ps -aux | grep ethminer | wc -l)"
[ "$minercount" -le 1 ] && >&2 echo "\033[31;1m[ERROR] Miner is not running!\033[0;0m"

# Samba mounted?
[ -z "$(mount | grep /home/shared)" ] && >&2 echo "\033[31;1m[ERROR] Samba directory is not mounted! run: sudo mount -a\033[0;0m"

# Look for unread emails
newmail=$($HOME/sh/count-new-mail.sh)
[ "$newmail" -eq 1 ] && echo "\033[34;1m[WARNING] You have a pending email!\033[0;0m"
[ "$newmail" -gt 1 ] && echo "\033[34;1m[WARNING] $newmail unread emails found!\033[0;0m"

#                                                                           PS1
###############################################################################

export PS1='%F{green}[%F{magenta}%l%f:%F{cyan}%!%F{green}][%F{red}%n%f@%F{yellow}%m%f:%F{blue}%~%F{green}]$%f '
