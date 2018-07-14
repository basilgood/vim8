scriptencoding utf-8

set laststatus=2
set statusline=
set statusline+=%(%{'help'!=&filetype?'\ \ '.bufnr('%'):''}\ %)
set statusline+=%{fugitive#head()!=''?'\ \ '.fugitive#head().'\ ':''}
set statusline+=\ %f
set statusline+=\ %{&modified?'\ \ +':''}
set statusline+=\ %{&readonly?'\ \ ':''}
set statusline+=%=
set statusline+=\ %{''!=#&filetype?&filetype:'none'}
set statusline+=\ %5v/%l
set statusline+=\ %4L
