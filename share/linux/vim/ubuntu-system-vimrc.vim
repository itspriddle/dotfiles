" Load runtime files from ~priddle/.vim for any users. Drop it in
" /etc/vim/vimrc.local on Ubuntu systems

set runtimepath=~priddle/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,$VIMRUNTIME,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after
set nocompatible

source ~priddle/.vim/vimrc

" Disable Plug commands that would leave root owned files in ~priddle/.vim
delcommand PlugUpgrade
delcommand PlugUpdate

" vim: set ft=vim:
