scriptencoding utf-8

if !exists('g:tabular_loaded')
  autocmd MyAutoCmd CmdlineEnter * call plug#plug('tabular')
endif
