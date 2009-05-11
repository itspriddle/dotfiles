#umask 022

# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

#export PATH=/opt/local/bin:/usr/local/bin:/usr/local/mysql/bin:"${PATH}"
export PATH=/opt/local/bin:/usr/local/bin:"${PATH}"
export CLICOLOR=1
export LSCOLORS=ExGxFxdxCxDxDxBxBxExEx
export TERM=xterm
