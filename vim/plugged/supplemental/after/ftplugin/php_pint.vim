function! s:PintCheck(args)
  let l:output = system('pint --format=txt --test --verbose ' . a:args)
  let l:qflist = []
  let l:lines = split(l:output, '\n')
  let l:i = 0

  while l:i < len(l:lines)
    let l:line = l:lines[l:i]

    " Match violation header: "   8) /path/to/file.php (rule1, rule2)"
    let l:match = matchlist(l:line, '^\s*\d\+)\s\+\(.\{-}\)\s\+(\(.*\))$')
    if !empty(l:match)
      let l:filename = l:match[1]
      let l:rules = l:match[2]
      let l:line_numbers = []

      " Look ahead for diff content
      let l:j = l:i + 1
      let l:in_diff = 0

      while l:j < len(l:lines)
        let l:diff_line = l:lines[l:j]

        " Start of diff
        if l:diff_line =~ '^\s*---------- begin diff ----------'
          let l:in_diff = 1
        " End of diff
        elseif l:diff_line =~ '^\s*----------- end diff -----------'
          break
        " Parse hunk headers like "@@ -29,7 +29,8 @@"
        elseif l:in_diff && l:diff_line =~ '^@@'
          let l:hunk_match = matchlist(l:diff_line, '^@@ -\(\d\+\),\?\d* +\(\d\+\),\?\d* @@')
          if !empty(l:hunk_match)
            " Use the line number from the original file (first number)
            call add(l:line_numbers, str2nr(l:hunk_match[1]))
          endif
        endif

        let l:j += 1
      endwhile

      " Create quickfix entries for each line number, or default to line 1
      if empty(l:line_numbers)
        call add(l:line_numbers, 1)
      endif

      for l:lnum in l:line_numbers
        call add(l:qflist, {
          \ 'filename': l:filename,
          \ 'lnum': l:lnum,
          \ 'text': l:rules,
          \ 'type': 'E'
          \ })
      endfor
    endif

    let l:i += 1
  endwhile

  let title = "Pint Violations (" . len(l:qflist) . " items)"

  call setqflist([], "r", { "items": l:qflist, "title": title })

  if !empty(l:qflist)
    botright copen
    echo 'Found ' . len(l:qflist) . ' Pint violations across ' . len(l:qflist) . ' locations'
  else
    echo 'No Pint violations found'
  endif
endfunction

function! s:Pint(args, bang) abort
  if &modified
    echohl WarningMsg
    echo "Buffer modified, save before running Pint."
    echohl None
    return
  endif

  let l:args = (empty(a:args) ? expand("%") : a:args)

  if a:bang
    execute "Dispatch! pint --format=txt --verbose" l:args
  else
    call s:PintCheck(l:args)
  endif
endfunction

command! -buffer -bang -complete=file -nargs=* Pint call s:Pint(<q-args>, <bang>0)

nnoremap <buffer> <leader>p :Pint!<CR>

let b:undo_ftplugin = get(b:, "undo_ftplugin", "exe") .
  \ "|execute 'unmap <buffer> <leader>p'" .
  \ "|delcommand Pint"
