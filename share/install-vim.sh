#!/usr/bin/sh

wget ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2
tar -vjxf vim-7.3.tar.bz2
cd vim73
./configure --prefix="$HOME/local" \
            --with-features=huge \
            --enable-multibyte \
            --enable-perlinterp \
            --enable-pythoninterp \
            --enable-rubyinterp
make
make install
