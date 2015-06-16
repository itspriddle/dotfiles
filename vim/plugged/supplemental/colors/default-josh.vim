" Based on $VIMRUNTIME/colors/default.vim
"
" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
highlight clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "default-josh"

hi SpecialKey     term=bold ctermfg=4
hi NonText        term=bold ctermfg=12
hi Directory      term=bold ctermfg=4
hi ErrorMsg       term=standout ctermfg=15 ctermbg=1
hi IncSearch      term=reverse cterm=reverse
hi Search         term=reverse ctermfg=235 ctermbg=221
hi MoreMsg        term=bold ctermfg=2
hi ModeMsg        term=bold cterm=bold
hi LineNr         term=underline ctermfg=130
hi CursorLineNr   term=bold ctermfg=130
hi Question       term=standout ctermfg=2
hi StatusLine     term=bold,reverse cterm=bold,reverse
hi StatusLineNC   term=reverse cterm=reverse
hi VertSplit      term=reverse cterm=reverse
hi Title          term=bold ctermfg=5
hi Visual         term=reverse ctermbg=7
hi VisualNOS      term=bold,underline cterm=bold,underline
hi WarningMsg     term=standout ctermfg=1
hi WildMenu       term=standout ctermfg=0 ctermbg=11
hi Folded         term=standout ctermfg=4 ctermbg=248
hi FoldColumn     term=standout ctermfg=4 ctermbg=248
hi DiffAdd        term=bold ctermbg=81
hi DiffChange     term=bold ctermbg=225
hi DiffDelete     term=bold ctermfg=12 ctermbg=159
hi DiffText       term=reverse cterm=bold ctermbg=9
hi SignColumn     term=standout ctermfg=4 ctermbg=248
hi Conceal        ctermfg=7 ctermbg=242
hi SpellBad       term=reverse ctermfg=0 ctermbg=224
hi SpellCap       term=reverse ctermfg=0 ctermbg=81
hi SpellRare      term=reverse ctermbg=225
hi SpellLocal     term=underline ctermbg=14
hi Pmenu          ctermfg=0 ctermbg=225
hi PmenuSel       ctermfg=0 ctermbg=7
hi PmenuSbar      ctermbg=248
hi PmenuThumb     ctermbg=0
hi TabLine        term=underline cterm=underline ctermfg=0 ctermbg=7
hi TabLineSel     term=bold cterm=bold
hi TabLineFill    term=reverse cterm=reverse
hi CursorColumn   term=reverse ctermbg=7
hi CursorLine     term=underline cterm=underline
hi ColorColumn    term=reverse ctermbg=224
hi MatchParen     term=reverse ctermbg=14
hi Comment        term=bold ctermfg=4
hi Constant       term=underline ctermfg=1
hi Special        term=bold ctermfg=5
hi Identifier     term=underline ctermfg=6
hi Statement      term=bold ctermfg=130
hi PreProc        term=underline ctermfg=5
hi Type           term=underline ctermfg=2
hi Underlined     term=underline cterm=underline ctermfg=5
hi Ignore         ctermfg=15
hi Error          term=reverse ctermfg=15 ctermbg=9
hi Todo           term=standout ctermfg=0 ctermbg=11
" hi link Constant String
" hi link Constant Character
" hi link Constant Number
" hi link Constant Boolean
" hi link Number Float
" hi link Identifier Function
" hi link Statement Conditional
" hi link Statement Repeat
" hi link Statement Label
" hi link Statement Operator
" hi link Statement Keyword
" hi link Statement Exception
" hi link PreProc Include
" hi link PreProc Define
" hi link PreProc Macro
" hi link PreProc PreCondit
" hi link Type StorageClass
" hi link Type Structure
" hi link Type Typedef
" hi link Special Tag
" hi link Special SpecialChar
" hi link Special Delimiter
" hi link Special SpecialComment
" hi link Special Debug
" hi link Statement helpHeadline
" hi link PreProc helpSectionDelim
" hi link Ignore helpIgnore
" hi link Comment helpExample
" hi link Ignore helpBar
" hi link Ignore helpStar
" hi link Identifier helpHyperTextJump
" hi link String helpHyperTextEntry
" hi link Ignore helpBacktick
" " hi helpNormal     cleared
" hi link Identifier helpVim
" hi link Type helpOption
" hi link Comment helpCommand
" hi link PreProc helpHeader
" " hi helpGraphic    cleared
" hi link Todo helpNote
" hi link Special helpSpecial
" " hi helpLeadBlank  cleared
" hi link Special helpNotVi
" hi link Comment helpComment
" hi link Constant helpConstant
" hi link String helpString
" hi link Character helpCharacter
" hi link Number helpNumber
" hi link Boolean helpBoolean
" hi link Float helpFloat
" hi link Identifier helpIdentifier
" hi link Function helpFunction
" hi link Statement helpStatement
" hi link Conditional helpConditional
" hi link Repeat helpRepeat
" hi link Label helpLabel
" hi link Operator helpOperator
" hi link Keyword helpKeyword
" hi link Exception helpException
" hi link PreProc helpPreProc
" hi link Include helpInclude
" hi link Define helpDefine
" hi link Macro helpMacro
" hi link PreCondit helpPreCondit
" hi link Type helpType
" hi link StorageClass helpStorageClass
" hi link Structure helpStructure
" hi link Typedef helpTypedef
" hi link SpecialChar helpSpecialChar
" hi link Tag helpTag
" hi link Delimiter helpDelimiter
" hi link SpecialComment helpSpecialComment
" hi link Debug helpDebug
" hi link Underlined helpUnderlined
" hi link Error helpError
" hi link Todo helpTodo
" hi link String helpURL
