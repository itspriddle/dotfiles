" Fix quote color issue that started around May-June 2020.
syn region  shDoubleQuote      matchgroup=shQuote start=+"+ skip=+\\"+ end=+"+         contained       contains=@shDblQuoteList,shStringSpecial,@Spell nextgroup=shSpecialStart
