" vim74.vim - Customizations for Vim 7.4
" Author:  Joshua Priddle <jpriddle@me.com>
" URL:     http://git.io/4xAVTQ

if v:version < 704
  finish
endif

" Vim 7.4 has a new regex engine that is slow with Ruby syntax so use the old
" one from Vim 7.3. (see http://stackoverflow.com/a/16920294).
if exists("&regexpengine")
  set regexpengine=1
end
