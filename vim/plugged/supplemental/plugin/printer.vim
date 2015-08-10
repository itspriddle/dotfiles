" Settings for printing (paper) with :hardcopy

if has("printer")
  " 30pt margins on all sides
  set printoptions=left:30pt,right:30pt,top:30pt,bottom:30pt

  " Disable dupex printing
  set printoptions+=duplex:off

  " Set paper size to standard US letter
  set printoptions+=paper:letter

  " Disable syntax highlighting when printing
  set printoptions+=syntax:n

  " Set the font-size to 9. Default font is probably Courier, depends on your
  " printer.
  set printfont=:h9
endif
