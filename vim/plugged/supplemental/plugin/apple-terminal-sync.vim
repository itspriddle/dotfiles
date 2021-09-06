if $TERM_PROGRAM != "Apple_Terminal" || $SSH_CONNECTION != ''
  finish
endif

if !get(g:, "enable_apple_terminal_sync", 0)
  finish
endif

let s:themes = {"light": "Solarized Light", "dark": "Solarized Dark"}

function! s:osascript(cmd) abort
  return trim(system('osascript -e ' . shellescape(a:cmd)))
endfunction

function! s:out_cb(channel, msg)
  let g:solar = trim(a:msg)
endfunction

function! s:set_terminal_theme(theme) abort
  let cmd = 'tell application "Terminal" to set current settings of window 1 to settings set "'. a:theme .'"'
  let job = job_start(["osascript", "-e", cmd], {"in_io": "null", "out_io": "null", "err_io": "null"})
  let s:current_theme = a:theme
endfunction

function! s:get_current_terminal_theme() abort
  let cmd = 'tell application "Terminal" to name of current settings of window 1'

  return s:osascript(cmd)
endfunction

function! s:init()
  if g:colors_name !~ 'solarized8\?'
    return
  end

  if get(s:, "original_theme", "") == ""
    let s:current_theme = s:get_current_terminal_theme()
    let s:original_theme = s:current_theme

    if s:current_theme !~ &background
      let &background = &background == "light" ? "dark" : "light"
    endif
  endif
endfunction

function! s:refresh()
  if !exists("s:current_theme")
    return
  endif
  if s:current_theme !~ &background
    call s:set_terminal_theme(s:themes[&background])
  endif
endfunction

function! s:cleanup()
  if get(s:, "original_theme", "") == ""
    return
  endif

  if s:original_theme != s:current_theme
    call s:set_terminal_theme(s:original_theme)
  endif
endfunction

augroup apple_terminal_sync_solarized
  autocmd!

  " Race conditions are fun, timer_start here avoids needing to
  " doautocmd ColorScheme
  autocmd VimEnter * ++once call timer_start(1, { tid -> s:init() })
  autocmd ColorScheme * call s:refresh()
  autocmd VimLeave * call s:cleanup()
augroup END
