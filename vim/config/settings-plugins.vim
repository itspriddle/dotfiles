" ------------------------------------------------------------------------------
" Plugin Settings/Mappings
"
" Configuration and custom mappings used with third party plugins.
" ------------------------------------------------------------------------------

" editorconfig-vim {{{

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" }}}

" fzf.vim {{{

" Note this is the fzf.vim shipped with fzf itself, not the separate fzf.vim
" project

let g:fzf_layout = { "down": 10 }

noremap <silent> <expr> <c-p> (&ft == "qf" ? ":" : ":FZF")."\<cr>"
noremap <c-b> :echoerr "Use `<leader>b`!"<cr>

nnoremap <leader>b :FZFBuffers<cr>
nnoremap <leader>m :FZFMRU<cr>
nnoremap <leader>M :FZFMRU!<cr>

" }}}

" QFEnter.vim {{{

let g:qfenter_keymap       = {}
let g:qfenter_keymap.open  = ['<CR>', 'o']
let g:qfenter_keymap.vopen = ['<C-v>']
let g:qfenter_keymap.hopen = ['<C-h>', '<C-s>']
let g:qfenter_keymap.topen = ['<C-t>']

" }}}

" simple-ag.vim {{{

" Opens command line with `:Ag `, results go to Quickfix
noremap <leader>f :Ag<space>

" Opens command line with `:LAg `, results go to Location List
noremap <leader>F :LAg<space>

" Use ripgrep if available
if executable("rg")
  let g:simple_ag_command = "rg --max-columns-preview --max-columns 5000 -H --no-heading --sort-files --vimgrep %s"
endif

" }}}

" simple-qf-toggle.vim {{{

" Toggle quickfix, like unimpaired
nmap yoq <Plug>(simple-qf-toggle)
nmap yoQ <Plug>(simple-qf-toggle-ll)

" Use old `co` style map to change options
nmap co yo

" }}}

" vim-easy-align {{{

" Allow aligning stuff that is commented out
let g:easy_align_ignore_groups = []

" Setup custom alignments
let g:easy_align_delimiters = {
  \ '-':  {
  \   'pattern':       '-',
  \   'left_margin':   1,
  \   'right_margin':  1,
  \   'stick_to_left': 0
  \   }
  \ }

" Map <leader>a[char] => :EasyAlign[char]<cr>
vmap <expr> <leader>a ':EasyAlign'.nr2char(getchar()).'<cr>'

" Space doesn't work with the above map, so define it explicitly.
vmap <leader>a<space> :EasyAlign\<cr>

" Align Markdown style tables, changes:
"
" |foo|bar|foobar|
" |1|2|3|
"
" to
"
" | foo | bar | foobar |
" | 1   | 2   | 3      |
vmap <leader>a<bar> :EasyAlign *<bar><cr>

" }}}

" vim-eunuch {{{

" :Rename, opens command line with `:Rename current_file`
nnoremap <leader>r :Rename <c-r>=expand('%:t')<cr><space>

" :Remove, deletes current buffer/file.
nnoremap <leader>R :Delete

" }}}

" vim-filebeagle {{{

let g:filebeagle_suppress_keymaps = 1
let g:filebeagle_show_hidden = 1
map <silent> - <Plug>FileBeagleOpenCurrentBufferDir

" }}}

" vim-fugitive {{{

" Stage the current file to the index
map <leader>gw :Gwrite<cr>

" Open :G (full window)
map <leader>gv :Ge :<cr>

" }}}

" vim-gutentags {{{

" Keep tags files under .git
let g:gutentags_ctags_tagfile = ".tags"

" Don't let Gutentags `set tags`
let g:gutentags_ctags_auto_set_tags = 0

" Use ripgrep to list files
let g:gutentags_file_list_command = 'rg --files'

" }}}

" vim-liquid {{{

let g:liquid_highlight_types = ['ruby', 'javascript']

" }}}

" vim-markdown (plasticboy) {{{

" Don't mess with indents when hitting enter on a list item
let g:vim_markdown_new_list_item_indent = 0

" Don't automatically insert bullets hitting enter on a list item
"
" (This fixes annoying behavior when using gq to format long lines where every
" new line gets a bullet)
let g:vim_markdown_auto_insert_bullets = 0

" Disable folding
let g:vim_markdown_folding_disabled = 1

" Highlight YAML frontmatter (i.e. Jekyll)
let g:vim_markdown_frontmatter = 1

" }}}

" vim-marked {{{

let g:marked_auto_quit = 1
let g:marked_filetypes = ["markdown", "liquid"]

" }}}

" vim-peekaboo {{{

" Normal mode:
"   <leader>"
"   <leader>@
"
" Insert mode:
"   <ctrl-r>
let g:peekaboo_prefix	= "<leader>"

" }}}

" vim-php {{{

" Disable indentation for ->; I don't want
"     $foo = $bar()->baz()
"                  ->qux();
"
" I do want
"     $foo = $bar()->baz()
"         ->qux();
"
let g:PHP_noArrowMatching = 1

" Use "traditional" switch indentation. Not:
"
"     switch ($foo) {
"     case 1:
"         break;
"     default:
"     }
"
" But rather:
"
"     switch ($foo) {
"         case 1:
"             break;
"         default:
"     }
let g:PHP_vintage_case_default_indent = 1

" }}}

" vim-rsi {{{

" Disable meta maps, causes a jump to back to insert mode if `<ESC>b` is
" pressed too fast in insert mode.
let g:rsi_no_meta = 1

" }}}

" vim-unimpaired {{{

" Open insert mode with 'paste'
nmap yp <Plug>unimpairedPastei
nmap yP <Plug>unimpairedPasteo

" }}}

" vim:ft=vim:ts=2:sw=2:sts=2:et:fdm=marker
