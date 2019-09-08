set encoding=utf-8
scriptencoding utf-8

let skip_defaults_vim=1

augroup VGroup
  autocmd!
  autocmd FileType,Syntax,BufNewFile,BufNew,BufRead *?
        \ call vimrc#on_filetype()
augroup END

if has('vim_starting')
  let g:startuptime = reltime()
  autocmd VGroup VimEnter * let g:startuptime = reltime(g:startuptime) | redraw
  \ | echomsg 'startuptime: ' . reltimestr(g:startuptime)
endif

function! s:source_rc(path, ...) abort
  let abspath = resolve(expand('~/.vim/rc/' . a:path))
  execute 'source' fnameescape(abspath)
  return
endfunction

if has('vim_starting')
  call s:source_rc('dirs.vim')
endif

call options#options()
call unix#unix()
call mappings#map()
call commands#commands()
call autocmds#autocmds()
call diff#diff()

call s:source_rc('dein_rc.vim')

if has('vim_starting') && !empty(argv())
  call vimrc#on_filetype()
endif

if !has('vim_starting')
  call dein#call_hook('source')
  call dein#call_hook('post_source')

  syntax enable
  filetype plugin indent on
endif

let g:LargeFile = 20*1024*1024 " 20MB

set background=dark
colorscheme simple
highlight ParenMatch guifg=#85EB6A guibg=#135B00 gui=NONE   cterm=NONE term=reverse ctermbg=11
highlight Comment    guifg=#5c6370 guibg=NONE    gui=italic cterm=italic

set secure
