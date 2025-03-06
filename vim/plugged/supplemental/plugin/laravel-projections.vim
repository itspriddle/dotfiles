" Author:  Joshua Priddle <jpriddle@me.com>
" Version: 0.0.0
" License: Same as Vim itself (see :help license)

if &cp || exists("g:laravel_projections") && g:laravel_projections
  finish
else
  let g:laravel_projections = 1
endif

let s:projection_path = resolve(expand('<sfile>:p:h') . '/laravel-projections.json')

function! s:projectionist_detect()
  if get(b:, 'composer_root', '') == '' || empty(get(b:, 'projectionist'))
    return
  endif

  if !filereadable(b:composer_root.'/artisan')
    return
  endif

  " Remove vim-composer's projections, we'll set our own
  call filter(b:projectionist[b:composer_root], {_, v -> !has_key(v, "*")})

  let json = readfile(s:projection_path)
  let projections = projectionist#json_parse(json)

  call projectionist#append(b:composer_root, projections)
endfunction

augroup laravel_projections
  autocmd!
  autocmd User ProjectionistDetect call s:projectionist_detect()
augroup END
