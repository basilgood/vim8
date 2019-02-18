scriptencoding utf-8

if !exists('g:matchup_matchparen_deferred')
  autocmd MyAutoCmd CursorHold,CursorMoved * call plug#plug('vim-matchup')
endif
let g:matchup_matchparen_deferred = 1
