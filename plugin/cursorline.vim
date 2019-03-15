scriptencoding utf-8

autocmd MyAutoCmd InsertLeave,VimEnter,WinEnter * setlocal cursorline
autocmd MyAutoCmd InsertEnter,WinLeave * setlocal nocursorline
