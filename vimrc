filetype on  " Automatically detect file types.
set nocompatible  " We don't want vi compatibility.
 
" Add recently accessed projects menu (project plugin)
set viminfo^=!
 
" alt+n or alt+p to navigate between entries in QuickFix
"map <silent> <m-p> :cp <cr>
"map <silent> <m-n> :cn <cr>

map <C-H> <C-W>h  
map <C-J> <C-W>j  
map <C-K> <C-W>k  
map <C-L> <C-W>l  

map <M-Tab> :Tbbn<CR>
 
" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'

let g:NERDTreeMapActivateNode = '<CR>' 
syntax enable
set showmatch  " Show matching brackets.
