scriptencoding utf-8

if !exists('loaded_cmdline_completion')
  autocmd MyAutoCmd CmdlineEnter * call plug#plug('cmdline-completion')
endif
