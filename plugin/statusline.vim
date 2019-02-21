scriptencoding utf-8

set laststatus=2
set statusline=
set statusline+=\ %n
set statusline+=\ ᚛
set statusline+=\ %{pathshorten(expand('%:~:.'))}
set statusline+=\ %h%r
set statusline+=\ %{exists('g:loaded_fugitive')?'₼:'.fugitive#head():''}
set statusline+=\ %m
set statusline+=%=
set statusline+=\ %{&filetype!=#''?&filetype:'none'}
set statusline+=\ %12(%c:%l/%L%)
set statusline+=\ %*
