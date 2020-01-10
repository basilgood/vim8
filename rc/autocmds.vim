scriptencoding utf-8

"""" autocmds
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

" grep.
autocmd vimRc QuickFixCmdPost cgetexpr cwindow

"""" qf and help keep widow full width
autocmd vimRc FileType qf wincmd J
autocmd vimRc BufWinEnter * if &ft == 'help' | wincmd J | end

"""" update diff
autocmd vimRc InsertLeave * if &l:diff | diffupdate | endif

"""" external changes
autocmd vimRc FocusGained,CursorHold * if !bufexists("[Command Line]") | checktime | GitGutter | endif

"""" mkdir
autocmd vimRc BufWritePre *
    \ if !isdirectory(expand('%:h', v:true)) |
    \   call mkdir(expand('%:h', v:true), 'p') |
    \ endif

"""" fugitive files
autocmd vimRc FileType git setlocal nofoldenable

"""" hlsearch
autocmd vimRc CursorMoved,InsertLeave * call functions#highlight_current()
autocmd vimRc InsertEnter * ClearCurrentSearch
" autocmd vimRc BufRead,BufNewFile * syn match parens /[(){}<>[]/ | hi parens ctermfg=8

"""" filetype
autocmd vimRc BufNewFile,BufRead *.jsx setlocal filetype=javascript
autocmd vimRc BufReadPre,BufNewFile *.tsx setlocal filetype=typescript
autocmd vimRc BufNewFile,BufRead *.twig setlocal filetype=html.twig
autocmd vimRc BufRead,BufNewFile *.gitignore  setlocal filetype=gitignore
autocmd vimRc BufReadPre,BufNewFile *.twig setlocal filetype=twig.html
autocmd vimRc BufWinEnter *.json setlocal conceallevel=0 concealcursor=
autocmd vimRc BufReadPre *.json setlocal conceallevel=0 concealcursor=
autocmd vimRc BufReadPre *.json setlocal formatoptions=a2tq
