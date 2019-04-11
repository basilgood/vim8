scriptencoding utf-8

if !exists('g:tabular_loaded')
  autocmd MyAutoCmd CmdlineEnter * call functions#plug('tabular')
endif
