" encoding
set encoding=utf-8
scriptencoding utf-8

" vim 8 defaults
unlet! skip_defaults_vim
silent! source $VIMRUNTIME/defaults.vim

" disable some internal plugins
let g:loaded_rrhelper = 1
let g:did_install_default_menus = 1

" general autogroup
augroup vimRc
  autocmd!
augroup END

source ~/.vim/plug.vim
source ~/.vim/pconf.vim
" source ~/.vim/plugins.vim
" source ~/.vim/plug_config.vim
source ~/.vim/options.vim
source ~/.vim/mappings.vim
source ~/.vim/autocmds.vim
source ~/.vim/commands.vim

syntax enable

set background=dark
silent! colorscheme min

set secure
