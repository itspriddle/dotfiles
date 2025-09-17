" Lightline.vim settings

let s:theme_map = { 'solarized8': 'solarized' }

" Use the solarized theme and enable custom component logic
let g:lightline = {
  \   "colorscheme": get(s:theme_map, g:colors_name, 'solarized'),
  \   "component_function": {
  \     "filename": "g:josh_lightline.filename",
  \     "modified": "g:josh_lightline.modified",
  \     "readonly": "g:josh_lightline.readonly"
  \   },
  \   "component_visible_condition": {
  \     "modified": "(&filetype != 'qf') && (&modified || !&modifiable)"
  \   }
  \ }

" Namespace for customization functions
let g:josh_lightline = {}

" Hides RO (readonly) when filetype is "help".
function! g:josh_lightline.readonly() dict abort
  return &readonly && &filetype !=# "help" ? "RO" : ""
endfunction

" If the buffer was modified, returns "+". If the buffer is not modifiable and
" filetype is not "quickfix" or "help", returns "-". Otherwise returns "".
function! g:josh_lightline.modified() dict abort
  return &modified ? "+" :
    \ &filetype !~# "\\(qf\\|help\\)" && !&modifiable ? "-" : ""
endfunction

" Grabs the current buffer name. If it is a quickfix window, try to use
" `w:quickfix_title` as the name, to display the command used.
function! g:josh_lightline.filename() dict abort
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
    \   if expand("<amatch>") =~ '^solarized8\?$' |
    \     let g:lightline.colorscheme = 'solarized' |
    \     runtime autoload/lightline/colorscheme/solarized.vim |
    \   elseif expand("<amatch>") =~ '^catppuccin' |
    \     let g:lightline.colorscheme = 'catppuccin' |
    \     runtime autoload/lightline/colorscheme/catppuccin.vim |
    \   elseif expand("<amatch>") == 'onedark' |
    \     let g:lightline.colorscheme = 'onedark' |
    \     runtime autoload/lightline/colorscheme/onedark.vim |
    \   endif |
    \   call lightline#init() |
    \   call lightline#colorscheme() |
    \   call lightline#update() |
    \ endif
augroup END
