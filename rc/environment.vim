scriptencoding utf-8

let $CACHE         = expand('$HOME/.cache/')
let $CACHE_HOME    = expand('$CACHE/vim')
let $VIM_PATH      = expand('~/.vim')
let $MYVIMRC       = expand('~/.vim/vimrc')
let $BACKUP_PATH   = expand('$CACHE/vim/back')

let s:undo_dir     = $CACHE_HOME . '/undo'
let s:backup_dir   = $CACHE_HOME . '/back'
let s:directory    = $CACHE_HOME . '/dir'
let s:view_dir     = $CACHE_HOME . '/view'
let s:sessions_dir = $CACHE_HOME . '/session'

call functions#mkdir(s:undo_dir)
call functions#mkdir(s:backup_dir)
call functions#mkdir(s:directory)
call functions#mkdir(s:view_dir)
call functions#mkdir(s:sessions_dir)

"""" path
set path=.,**

"""" backup, swap, undo
set undofile
set nobackup
set swapfile
exe 'set undodir=' . s:undo_dir
exe 'set backupdir=' . s:backup_dir
exe 'set directory=' . s:directory
exe 'set viewdir=' . s:view_dir
set viewoptions=cursor,folds,slash,unix
