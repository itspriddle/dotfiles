" Clear maps set by /etc/vimrc
mapclear | mapclear <buffer> | mapclear! | mapclear! <buffer>

" Reset settings (doesn't work on Synology's Vim 8.2)
"set &all

" Initialize
source ~priddle/.dotfiles/share/linux/vim/ubuntu-system-vimrc.vim
source ~priddle/.dotfiles/vim/vimrc

" Set fallback to vim runtime files I copied from Ubuntu
set rtp+=~priddle/local/share/vim/vim82/

" Disable Plug commands that would leave root owned files in ~priddle/.vim
delcommand PlugUpgrade
delcommand PlugUpdate
