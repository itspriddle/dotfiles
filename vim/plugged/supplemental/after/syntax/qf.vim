" Hide "|| " at the beginning of quickfix lines
syntax match ConcealedDetails /\v^\|\| / conceal
setlocal conceallevel=2
setlocal concealcursor=nvic
