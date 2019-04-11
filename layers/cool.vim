scriptencoding utf-8

if !exists('g:CoolTotalMatches')
  autocmd MyAutoCmd CmdlineEnter * call functions#plug('vim-cool')
endif
let g:CoolTotalMatches = 1
