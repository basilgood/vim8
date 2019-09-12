set encoding=utf-8
scriptencoding utf-8

let skip_defaults_vim=1

if &compatible
  set nocompatible
endif

augroup vimRc
  autocmd!
augroup END

if has('vim_starting')
  let g:startuptime = reltime()
  autocmd vimRc VimEnter * let g:startuptime = reltime(g:startuptime) | redraw
  \ | echomsg 'startuptime: ' . reltimestr(g:startuptime)
endif

runtime dirs.vim
call options#options()
call timer_start(300, {-> remap#map()}, {'repeat': 0})
call unix#unix()
call autocmds#autocmds()
call timer_start(300, {-> commands#commands()}, {'repeat': 0})

if has('vim_starting')
  call vimrc#on_filetype()
endif

set background=dark
silent! colorscheme simple
highlight ParenMatch guifg=#85EB6A guibg=#135B00 gui=NONE   cterm=NONE term=reverse ctermbg=11
highlight Comment    guifg=#5c6370 guibg=NONE    gui=italic cterm=italic

set secure
