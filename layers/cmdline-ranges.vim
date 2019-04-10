scriptencoding utf-8

if !exists('g:loaded_cmdline_ranges')
  autocmd MyAutoCmd CmdlineEnter * call plug#plug('vim-cmdline-ranges')
endif
