set encoding=utf-8

if &compatible
  set nocompatible
endif

augroup MyVimrc
  autocmd!
augroup END
command! -nargs=* AutoCmd autocmd MyVimrc <args>

syntax enable
filetype plugin indent on

for f in split(glob('~/.vim/config/*.vim'), '\n')
  exe 'source' f
endfor
