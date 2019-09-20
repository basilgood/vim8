scriptencoding utf-8

" file types.
augroup vimrc_filetype
  autocmd!
  autocmd BufWritePost * nested
        \ if &l:filetype ==# '' || exists('b:ftdetect')
        \ |   unlet! b:ftdetect
        \ |   filetype detect
        \ | endif
augroup END

"""" mouse fix in multiple splits
autocmd vimRc BufRead,BufNewFile * setlocal ttymouse=sgr

"""" If a file is large, disable syntax highlighting, filetype etc
let g:LargeFile = 20*1024*1024 " 20MB
autocmd vimRc BufReadPre *
      \ let s = getfsize(expand("<afile>")) |
      \ if s > g:LargeFile || s == -2 |
      \   call functions#large_file(fnamemodify(expand("<afile>"), ":p")) |
      \ endif

"""" don't list location-list / quickfix windows
autocmd vimRc BufReadPost quickfix setlocal nobuflisted
autocmd vimRc BufReadPost quickfix nnoremap <buffer> gq :bd<CR>
autocmd vimRc FileType help nnoremap <buffer> gq :bd<CR>
autocmd vimRc CmdwinEnter * nnoremap <silent><buffer> gq :<C-u>quit<CR>

"""" qf and help keep widow full width
autocmd vimRc FileType qf wincmd J
autocmd vimRc BufWinEnter * if &ft == 'help' | wincmd J | end

"""" completion
autocmd vimRc FileType * execute 'setlocal dictionary+='.expand($HOME.'/.vim/dict/'.&filetype.'.dict')

"""" update diff
autocmd vimRc InsertLeave * if &l:diff | diffupdate | endif

"""" external changes
autocmd vimRc FocusGained,CursorHold * if !bufexists("[Command Line]") | checktime | endif

"""" mkdir
autocmd vimRc BufWritePre * call functions#mkdirifnotexist()

autocmd vimRc BufNewFile,BufRead * call matchadd('SpecialKey', '\s\+')
autocmd vimRc BufNewFile,BufRead * call matchadd('NonText', '\n\+')

"""" sessions
autocmd vimRc VimLeavePre * call sessions#make()

function! autocmds#autocmds() abort
endfunction
