" Highlighting for Claude Code's prompt editor (Ctrl-G).
"
" Claude Code opens the prompt in $EDITOR as a temp file named like
" `claude-prompt-<uuid>.md`. When the "include last response" option is on, the
" buffer is prefixed with a reference block whose every line starts with `#`:
"
"   # ─── Claude's last response (for reference; removed on save) ───
"   # ...quoted response...
"   # ─── Write your reply below this line ──────────────────────────
"   <blank>
"   <your reply — regular markdown>
"
" Those `#` lines render as markdown H1 headings by default. Render the whole
" reference block as comments instead, and leave the reply (everything past the
" first non-`#` line) as normal markdown.

" Only touch Claude prompt buffers; regular markdown is unaffected.
if expand('%:t') !~# '\v^claude-prompt-.*\.md$'
  finish
endif

" The block is the leading run of `#` lines, starting at the box-drawing header
" (`# ─`) at the top of the file and ending just before the first line that is
" not a comment. Anchoring the start on `# ─` avoids matching a reply that
" merely opens with a markdown heading when the reference block is absent.
syntax region claudePromptReference keepend
  \ start=/\%^# ─/
  \ end=/^#\@!/

highlight default link claudePromptReference Comment
