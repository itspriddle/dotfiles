" Use Marked.app (v1)
let g:marked_app = "Marked"

" Setup ``` style syntax highlighting
let g:markdown_fenced_languages = ['ruby', 'erb=eruby', 'php', 'sh']

" Marked.app view
noremap <buffer> <leader>mv :MarkedOpen<cr>

" Marked.app quit
noremap <buffer> <leader>mq :MarkedQuit<cr>

" Show spelling errors
setlocal spell

" Set textwidth
setlocal textwidth=78
