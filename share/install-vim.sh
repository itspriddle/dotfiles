#!/usr/bin/sh

wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
tar -vjxf vim-7.4.tar.bz2
cd vim74
./configure --prefix="$HOME/local" \
            --with-features=huge \
            --enable-gui=no \
            --with-tlib=ncurses \
            --disable-nls \
            --enable-multibyte \
            --enable-perlinterp \
            --enable-pythoninterp \
            --enable-rubyinterp

make
make install
