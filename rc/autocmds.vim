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

"""" cursorline
autocmd vimRc InsertLeave,WinEnter * setlocal cursorline
autocmd vimRc InsertEnter,WinLeave * setlocal nocursorline

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

"""" update diff
autocmd vimRc InsertLeave * if &l:diff | diffupdate | endif

"""" external changes
autocmd vimRc FocusGained,CursorHold * if !bufexists("[Command Line]") | checktime | endif

"""" mkdir
autocmd vimRc BufWritePre * call functions#mkdirifnotexist()

autocmd vimRc BufNewFile,BufRead * call matchadd('SpecialKey', '\s\+')
autocmd vimRc BufNewFile,BufRead * call matchadd('NonText', '\n\+')

"""" filetype
autocmd vimRc BufNewFile,BufRead *.nix setlocal filetype=nix
autocmd vimRc BufNewFile,BufRead *.twig setlocal filetype=html.twig
autocmd vimRc BufNewFile,BufRead *.svelte setlocal filetype=svelte
autocmd vimRc BufNewFile,BufRead *.gitignore  setlocal filetype=gitignore
autocmd vimRc BufNewFile,BufRead *.vim setlocal filetype=vim
autocmd vimRc BufNewFile,BufRead *.html setlocal filetype=html
autocmd vimRc BufNewFile,BufRead *.yamllint setlocal filetype=yaml
autocmd vimRc BufNewFile,BufRead *.yml setlocal filetype=yaml
autocmd vimRc BufNewFile,BufRead *.md,.markdown setlocal filetype=markdown
autocmd vimRc BufNewFile,BufRead *.j2 setlocal filetype=jinja
autocmd vimRc BufNewFile,BufRead *.coffee setlocal filetype=coffee
autocmd vimRc BufNewFile,BufRead *.ts,*.tsx setlocal filetype=typescript
autocmd vimRc BufWinEnter *.json setlocal conceallevel=0 concealcursor=
autocmd vimRc BufReadPre *.json setlocal conceallevel=0 concealcursor=
autocmd vimRc BufReadPre *.json setlocal formatoptions=a2tq
autocmd vimRc FileType json syntax match Comment +\/\/.\+$+
autocmd vimRc FileType jsonc setlocal commentstring=//\ %s
