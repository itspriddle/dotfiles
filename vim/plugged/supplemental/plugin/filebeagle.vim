" Load filebeagle.vim when editing a directory
augroup plug_load_filebeagle_from_directory
  autocmd!
  autocmd VimEnter *
    \ if isdirectory(expand("<amatch>")) |
    \   call plug#load('vim-filebeagle') |
    \   call filebeagle#FileBeagleOpenCurrentBufferDir() |
    \ endif
augroup END
