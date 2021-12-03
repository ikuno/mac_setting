bindkey -e

autoload zmv
autoload -U compinit
autoload -U zargs
compinit -u

stty -ixon

setopt extended_glob
setopt auto_pushd

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=1

function addpath {
    if [[ -e $1 ]]; then
        export PATH="$PATH:$1"
    fi
}

alias -g tail="tail -n 20"
alias -g head="head -n 20"
#alias -g lv="lv -c"
alias -g L="| lv"
alias -g S="| sed"
alias -g G="| grep"
alias -g GE="| grep -e"
alias -g V="| grep -v"
alias -g VE="| grep -v -e"
alias -g Q="| uniq"
alias -g R="| sort"
alias -g A="| awk"
alias -g H="| head"
alias -g T="| tail"
alias -g W="| wc"
alias -g WL="| wc -l"
alias -g H="--help"
alias -g HL="--help | lv"
alias -g B=">& /dev/null &"
alias -g N="> /dev/null"
alias -g ETO="2>&1"
alias -g PE="perl -e"
alias -g PNE="perl -ne"

if ls --color > /dev/null 2>&1; then
	alias ll='ls -lF --color'
	alias la='ls -aF --color'
	alias lal='ls -aFl --color'
	alias ls='ls -F --color'
else
	alias ll="ls -lF"
	alias la="ls -aF"
	alias lal="ls -alF"
	alias ls="ls -GF"
fi

alias -g ....="../.."
alias -g ......="../../.."
#alias -g esync="emerge --sync && emerge -avuD world"
alias termemacs="DISPLAY=\"\" emacs"
alias scr="screen -xR"
alias tg="tar -zxvf"
alias tb="tar -jxvf"
alias tc="tar -Zxvf"
alias -g unstable="ACCEPT_KEYWORDS=\"~amd64\""
alias -g emacsnw="title \"Emacs\"; emacs -nw"
alias -g mmv="noglob zmv -W"
alias gosh="rlwrap gosh"
alias -g mv="mv -i"
alias -g cp="cp -i"
alias grep="grep --color"
alias preview="open -a Preview.app"
alias clean='rm *~ .*~ #* ; rm core.*'

setopt prompt_subst
setopt print_eight_bit
setopt ignoreeof

if [[ "`id -u`" -eq 0 ]]; then
	PROMPT="%{[31m%}$USER@%m%{[m%}"
else
	PROMPT="%{[34m%}$USER@%m%{[m%}"
fi
if [[ "`uname -m`" = "i686" ]]; then
	PROMPT="$PROMPT [%{[32m%}gentoo32%{[m%}] $ "
else
	PROMPT="$PROMPT $ "
fi
RPROMPT="[%{[32m%}%~%{[m%}]"

setopt share_history

if [[ `uname -s` == "Darwin" ]]; then
# Initialize Fink.
# This command changes $PATH, so we should do before setting my PATH.
    test -r /sw/bin/init.sh && . /sw/bin/init.sh
fi

#addpath "/opt/local/bin"
#addpath "/opt/local/sbin"
#addpath "/usr/local/bin"
addpath "/usr/local/sbin"
addpath "$HOME/bin"
addpath "/Library/TeX/texbin/"

# we should avoid using global aliases.
if which \vim > /dev/null 2>&1; then
    export EDITOR="vim"
elif which \vi > /dev/null 2>&1; then
    export EDITOR="vi"
fi

if which \lv > /dev/null 2>&1; then
    export PAGER="lv"
elif which \less > /dev/null 2>&1; then
    export PAGER="less"
fi

#export MANPATH=/opt/local/man:$MANPATH
# for OpenGL
#ogl="-framework OpenGL -framework GLUT -framework Foundation"

# for pgplot
#pgp="-I/opt/local/include -L/opt/local/include -L/opt/local/lib -lcpgplot -lm"
#export PGPLOT_FOREGROUND=black
#export PGPLOT_BACKGROUND=white

# for pyenv
#export PATH="/usr/local/opt/openssl/bin:$PATH"

# For compilers to find openssl you may need to set:
#export LDFLAGS="-L/usr/local/opt/openssl/lib"
#export CPPFLAGS="-I/usr/local/opt/openssl/include"

# For pkg-config to find openssl you may need to set:
#export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

zstyle ':compilation:*' list-colors ${(s.:.)LS_COLORS}

HISTFILE=$HOME/.zsh-history
HISTSIZE=5000000
SAVEHIST=5000000
setopt extended_history
function history-all { history -E 1 }

function reload {
	source ~/.zshrc
}
#export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
