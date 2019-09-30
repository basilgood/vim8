set encoding=utf-8
scriptencoding utf-8

if &compatible | set nocompatible | endif

let skip_defaults_vim=1

augroup vimRc
 autocmd!
augroup END

if has('vim_starting') && has('reltime')
  let s:startuptime = reltime()
  au vimRc VimEnter * let s:startuptime = reltime(s:startuptime) | redraw
        \ | echomsg 'startuptime: ' . reltimestr(s:startuptime)
endif

call unix#unix()
source $HOME/.vim/rc/environment.vim
source $HOME/.vim/rc/unload.vim
source $HOME/.vim/rc/options.vim
source $HOME/.vim/rc/mapping.vim
source $HOME/.vim/rc/statusline.vim
source $HOME/.vim/minpac.vim
call commands#commands()
call autocmds#autocmds()
call diff#diff()

" sytax enable.
call vimrc#on_filetype()

set background=dark
silent! colorscheme simple
highlight ParenMatch guifg=#85EB6A guibg=#135B00 gui=NONE   cterm=NONE term=reverse ctermbg=11
highlight Comment    guifg=#5c6370 guibg=NONE    gui=italic cterm=italic

set secure
