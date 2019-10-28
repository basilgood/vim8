scriptencoding utf-8

" path
set path=.,**

" backup, swap, undo
if !isdirectory($HOME.'/.cache/vim/undo-dir')
  call mkdir($HOME.'/.cache/vim/undo-dir', 'p')
endif
set undodir=~/.cache/vim/undo-dir
set undofile
set nobackup
set noswapfile
set viewoptions+=cursor,folds,slash,unix
set viewoptions-=options

" plugins env
let $PACKPATH = $HOME . '/.vim/pack/Bundle'
let $GITHUB_COM = 'https://github.com/'
let g:plugins = {'start': [], 'opt': []}
