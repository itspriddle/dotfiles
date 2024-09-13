" Setup ``` style syntax highlighting
let g:markdown_fenced_languages = ['ruby', 'erb=eruby', 'php', 'sh']

" View current file in Marked 2
nnoremap <silent> <buffer> <leader>mv :MarkedOpen<cr>

" Preview selected text in Marked 2
vnoremap <silent> <buffer> <leader>mv :MarkedPreview<cr>

" Quit Marked 2
noremap <silent> <buffer> <leader>mq :MarkedQuit<cr>

" Show spelling errors
setlocal spell

" Set textwidth
setlocal textwidth=78

" Convert smart chars to normal ASCII
command! -buffer MarkdownFixup |
  \ silent exe "%s/[‘’]/'/ge | %s/[“”]/\"/ge | %s/—/---/ge | %s/–/--/ge"

" Render markdown with the GitHub Primer theme via `markdown-preview`
command! -buffer -range=% MarkdownPreview
  \ <line1>,<line2>w !markdown-preview

" If path starts with ~/work/notebook
if expand('%:p:h') =~ '/work/notebook'
  let b:StripperStripOnSave = 0
endif
