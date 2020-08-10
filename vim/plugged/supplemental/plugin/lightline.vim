" Lightline.vim settings

" Use the solarized theme and enable custom component logic
let g:lightline = {
  \   "colorscheme": "solarized" ,
  \   "component_function": {
  \     "filename": "lightline#_josh.filename",
  \     "modified": "lightline#_josh.modified",
  \     "readonly": "lightline#_josh.readonly"
  \   },
  \   "component_visible_condition": {
  \     "modified": "(&filetype != 'qf') && (&modified || !&modifiable)"
  \   }
  \ }

" Namespace for customization functions
let lightline#_josh = {}

" Hides RO (readonly) when filetype is "help".
function! lightline#_josh.readonly() dict abort
  return &readonly && &filetype !=# "help" ? "RO" : ""
endfunction

" If the buffer was modified, returns "+". If the buffer is not modifiable and
" filetype is not "quickfix" or "help", returns "-". Otherwise returns "".
function! lightline#_josh.modified() dict abort
  return &modified ? "+" :
    \ &filetype !~# "\\(qf\\|help\\)" && !&modifiable ? "-" : ""
endfunction

" Grabs the current buffer name. If it is a quickfix window, try to use
" `w:quickfix_title` as the name, to display the command used.
function! lightline#_josh.filename() dict abort
  if &filetype == "qf" && exists("w:quickfix_title")
    return w:quickfix_title
  else
    return expand("%:t") !=# "" ? expand("%:t") : "[No Name]"
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
    \ if !has('vim_starting') |
    \   if expand("<amatch>") =~ '^solarized8\?' |
    \     runtime autoload/lightline/colorscheme/solarized.vim |
    \   endif |
    \   call lightline#init() |
    \   call lightline#colorscheme() |
    \   call lightline#update() |
    \ endif
augroup END
