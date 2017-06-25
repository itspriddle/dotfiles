" Lightline.vim settings

" Use the solarized theme
let g:lightline = {
  \   "colorscheme": "solarized" ,
  \   "component_function": {
  \     "filename": "lightline#_josh.filename"
  \   }
  \ }

" Namespace for customization functions
let lightline#_josh = {}

" Grabs the current buffer name. If it is a quickfix window, try to use
" `w:quickfix_title` as the name, to display the command used.
function! lightline#_josh.filename() dict abort
  if &filetype == "qf" && exists("w:quickfix_title")
    return w:quickfix_title
  else
    return expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  end
endfunction

" Reset lightline when `colorscheme` or `set bg` are called.
"
" Eg:
"   :set bg=dark
"   :colorscheme solarized
"   " Vim colorscheme and Lightline theme is set to solarized dark
"   :set bg=light
"   " Vim colorscheme and Lightline theme is set to solarized light
augroup set_lightline_for_solarized
  autocmd!

  autocmd ColorScheme *
    \ if expand("<amatch>") == "solarized" |
    \   runtime autoload/lightline/colorscheme/solarized.vim |
    \ endif |
    \ call lightline#init() |
    \ call lightline#colorscheme() |
    \ call lightline#update()
augroup END