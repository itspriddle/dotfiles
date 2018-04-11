" simple-url-browse.vim
"
" Author:  Joshua Priddle <jpriddle@me.com>
" Version: 0.0.0
" License: Same as Vim itself (see :help license)
"
" `gx` is a command provided by Netrw that opens the URL under the cursor in
" your browser. Sometimes, in normal mode, `gx` does not detect a URL
" properly. For example, the default configuration (`<cfile>`) doesn't allow
" `?` characters. One can set `g:netrw_gx` to `<cWORD>` but that chokes on
" URLs in markdown or HTML-like files.
"
" This plugin attempts to fix this issue by scanning for a valid URL instead
" of relying on Vim expansions like `<cfile>` or `<cWORD>. It will detect a
" URL under cWORD, so things like `[foo](http://google.com/)` will work as
" expected.
"
" Note that `gx` in visual mode will use the default `<Plug>NetrwBrowseXVis`
" plugin command.

if &cp || exists("g:simple_url_browse_loaded") && g:simple_url_browse_loaded
  finish
else
  let g:simple_url_browse_loaded = 1
endif

" Regex to match a URL.
"
" Based on https://github.com/mattn/vim-textobj-url/blob/master/autoload/textobj/url.vim
let s:regex = '\(http\|https\|ftp\)://[a-zA-Z0-9][a-zA-Z0-9_-]*\(\.[a-zA-Z0-9][a-zA-Z0-9_-]*\)*\(:\d\+\)\?\(/[a-zA-Z0-9_/.\-+%?&=;@$,!''*~]*\)\?\(#[a-zA-Z0-9_/.\-+%#?&=;@$,!''*~]*\)\?'

" Private: Attempts to find a valid URL in cWORD and opens it. If one isn't
" found, the default NetrwBrowseX plugin command is called.
"
" Returns nothing.
function! s:browse()
  let url = matchstr(expand("<cWORD>"), s:regex)

  if url != ""
    call netrw#BrowseX(url, netrw#CheckIfRemote())
  else
    exe "normal \<Plug>NetrwBrowseX"
  endif
endfunction

" Plugin maps
nnoremap <silent> <Plug>(simple-url-browse) :call <SID>browse()<cr>
nmap <unique> gx <Plug>(simple-url-browse)
