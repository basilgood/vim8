scriptencoding utf-8

if !exists('loaded_cmdline_completion')
  autocmd MyAutoCmd CmdlineEnter * call functions#plug('cmdline-completion')
endif
