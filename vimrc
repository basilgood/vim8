set encoding=utf-8
scriptencoding utf-8

let skip_defaults_vim=1

if &compatible | set nocompatible | endif

augroup vimRc
  autocmd!
augroup END

if has('vim_starting')
  let g:startuptime = reltime()
  autocmd vimRc VimEnter * let g:startuptime = reltime(g:startuptime) | redraw
  \ | echomsg 'startuptime: ' . reltimestr(g:startuptime)
endif

let g:vimrc = expand('<sfile>')
let g:vimrc_root = fnamemodify(g:vimrc, ':h')
let s:rc_base_dir = g:vimrc_root . '/rc/'

execute 'set runtimepath^=' . fnameescape(g:vimrc_root)
execute 'set runtimepath^=' . fnameescape(s:rc_base_dir)

function! s:source_rc(path) abort
  execute 'source' fnameescape(s:rc_base_dir . a:path)
endfunction

call s:source_rc('dirs.vim')
call s:source_rc('options.vim')
call s:source_rc('unix.vim')
call s:source_rc('mappings.vim')

call s:source_rc('navigation.vim')
call s:source_rc('edit.vim')
call s:source_rc('git.vim')
call s:source_rc('lang.vim')
call s:source_rc('lint.vim')
call s:source_rc('misc.vim')
call s:source_rc('grep.vim')
call s:source_rc('statusline.vim')

call s:source_rc('autocmds.vim')
call s:source_rc('commands.vim')

if has('vim_starting')
  call vimrc#on_filetype()
endif

set background=dark
silent! colorscheme simple
highlight ParenMatch guifg=#85EB6A guibg=#135B00 gui=NONE   cterm=NONE term=reverse ctermbg=11
highlight Comment    guifg=#5c6370 guibg=NONE    gui=italic cterm=italic

set secure
