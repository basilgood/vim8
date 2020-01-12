" startup time
if !v:vim_did_enter && has('reltime')
  let g:startuptime = reltime()
  augroup vimrc-startuptime
    autocmd! VimEnter * ++once
          \                   let g:startuptime = reltime(g:startuptime)
          \                 | redraw
          \                 | echomsg 'startuptime: ' .. reltimestr(g:startuptime)
  augroup END
endif

" encoding
set encoding=utf-8
scriptencoding utf-8

" disable some plugins
let g:loaded_rrhelper           = 1
let g:did_install_default_menus = 1
let g:is_bash                   = 1
let g:sh_noisk                  = 1
let g:loaded_vimball            = 1
let g:loaded_vimballPlugin      = 1
let g:loaded_getscript          = 1
let g:loaded_getscriptPlugin    = 1
let g:loaded_logipat            = 1
let g:loaded_man                = 1

" vim 8 defaults
unlet! skip_defaults_vim
silent! source $VIMRUNTIME/defaults.vim

" main group
augroup vimRc
  autocmd!
augroup END

runtime! rc/packages.vim
runtime! rc/pluginsconf.vim
runtime! rc/lspdiagnostic.vim
runtime! rc/lsp.vim
runtime! rc/options.vim
runtime! rc/mappings.vim
runtime! rc/ruler.vim
runtime! rc/commands.vim
runtime! rc/autocmds.vim

syntax enable
if exists('$TMUX')
  set term=xterm-256color
endif

" cursor shape
let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[1 q"

" 256colors, transparent background, no bold fonts
set t_Co=256
set t_ut=
set t_md=
set background=dark
silent! colorscheme min

if v:vim_did_enter
  filetype off
endif
filetype plugin indent on

set secure
