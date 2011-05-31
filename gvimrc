if has("gui_macvim")
  set macmeta

  " Let full screen mode use the whole screen
  set fuopt+=maxhorz

  " Set window transparency to 20%
  "set transparency=2
end

" HACK: disables audio bell by enabling visual bell
" which doesnt work in macvim right now
set visualbell

set gcr=a:blinkon0 " No blinking cursor
set guioptions-=T  " hide toolbar
set guioptions-=r  " disable right scrollbar
set guioptions-=R  " disable right scrollbar
set guioptions-=l  " disable left scrollbar
set guioptions-=L  " disable left scrollbar

set guifont=Espresso\ Mono:h12
"set guifont=Monaco:h12
set guitablabel=%t
set title titlestring=%f

" Default window size
set lines=48 columns=150


" Highlight the current line
set cursorline

set spell

set nowrap


" Highlight tabs and eol
set listchars=tab:▸\ ,eol:¬,trail:·
set list


function! ToggleBG()
  if &bg == 'light'
    set bg=dark
  else
    set bg=light
  endif
endfunction

" Utility functions to create file commands
function! s:CommandCabbr(abbreviation, expansion)
  execute 'cabbrev ' . a:abbreviation . ' <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "' . a:expansion . '" : "' . a:abbreviation . '"<CR>'
endfunction

function! s:FileCommand(name, ...)
  if exists("a:1")
    let funcname = a:1
  else
    let funcname = a:name
  endif

  execute 'command -nargs=1 -complete=file ' . a:name . ' :call ' . funcname . '(<f-args>)'
endfunction

function! s:DefineCommand(name, destination)
  call s:FileCommand(a:destination)
  call s:CommandCabbr(a:name, a:destination)
endfunction


" Public NERDTree-aware versions of builtin functions
function! Touch(file)
  execute "!touch " . shellescape(a:file, 1)
  call s:UpdateNERDTree()
endfunction

function! ChangeDirectory(dir, ...)
  execute "cd " . fnameescape(a:dir)
  let stay = exists("a:1") ? a:1 : 1

  NERDTree

  if !stay
    wincmd p
  endif
endfunction

function! Mkdir(file)
  execute "!mkdir " . shellescape(a:file, 1)
  call s:UpdateNERDTree()
endfunction

function! Edit(file)
  if exists("b:NERDTreeRoot")
    wincmd p
  endif

  execute "e " . fnameescape(a:file)

ruby << RUBY
  destination = File.expand_path(VIM.evaluate(%{system("dirname " . shellescape(a:file, 1))}))
  pwd         = File.expand_path(Dir.pwd)
  home        = pwd == File.expand_path("~")

  if home || Regexp.new("^" + Regexp.escape(pwd)) !~ destination
    VIM.command(%{call ChangeDirectory(fnamemodify(a:file, ":h"), 0)})
  end
RUBY
endfunction

function! Remove(file)
  let current_path = expand("%")
  let removed_path = fnamemodify(a:file, ":p")

  if (current_path == removed_path) && (getbufvar("%", "&modified"))
    echo "You are trying to remove the file you are editing. Please close the buffer first."
  else
    execute "!rm " . shellescape(a:file, 1)
  endif

  call s:UpdateNERDTree()
endfunction

call s:DefineCommand("cd", "ChangeDirectory")
call s:DefineCommand("touch", "Touch")
call s:DefineCommand("mkdir", "Mkdir")
call s:DefineCommand("e", "Edit")
call s:DefineCommand("rm", "Remove")

autocmd VimEnter * call s:CdIfDirectory(expand("<amatch>"))

" if the parameter is a directory, cd into it
function! s:CdIfDirectory(directory)
  let explicitDirectory = isdirectory(a:directory)
  let directory = explicitDirectory || empty(a:directory)

  if explicitDirectory
    exe "cd " . fnameescape(a:directory)
  endif

  " Allows reading from stdin
  " ex: git diff | mvim -R -
  if strlen(a:directory) == 0
    return
  endif

  if directory
    NERDTree
    wincmd p
    bd
  endif

  if explicitDirectory
    wincmd p
  endif
endfunction

map <leader>bg :call ToggleBG()<cr>

" bind command-] to shift right
nmap <D-]> >>
vmap <D-]> >gv
imap <D-]> <C-O>>>

" bind command-[ to shift left
nmap <D-[> <<
vmap <D-[> <gv
imap <D-[> <C-O><<

" binds \ T to taglist (sorta like textmate apple-shift-t)
map <leader>T :TlistToggle<CR>

let Tlist_Ctags_Cmd='/opt/local/bin/ctags'
let Tlist_Show_Menu=1
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Close_On_Select=1
let Tlist_Compact_Format=1
let Tlist_Enable_Fold_Column=0
let Tlist_Use_Right_Window=1

" opt-backspace: delete word
imap <M-BS> <C-w>

" cmd-backspace: delete line
imap <D-BS> <C-u>

" Bind CMD-/ to comments (Like TextMate)
nmap <D-/> <C-_><C-_>
vmap <D-/> <C-_><C-_>gv
imap <D-/> <C-_><C-_>


