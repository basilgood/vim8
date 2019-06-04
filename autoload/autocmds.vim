scriptencoding utf-8

"""" filetype
autocmd MyAutoCmd BufRead,BufNewFile *.gitignore  set filetype=gitignore
autocmd MyAutoCmd BufNewFile,BufRead *.vim set filetype=vim
autocmd MyAutoCmd BufNewFile,BufRead *.nix set filetype=nix
autocmd MyAutoCmd BufNewFile,BufRead *.html set filetype=html
autocmd MyAutoCmd BufNewFile,BufRead *.yamllint set filetype=yaml
autocmd MyAutoCmd BufNewFile,BufRead *.yml set filetype=yaml
autocmd MyAutoCmd BufNewFile,BufRead *.vifm,vifmrc set filetype=vim

autocmd MyAutoCmd BufRead,BufNewFile *.md,.markdown packadd vim-markdown
let g:markdown_fenced_languages = ['html', 'vim', 'javascript', 'python', 'bash=sh']

autocmd MyAutoCmd BufReadPre,BufNewFile *.j2 packadd vim-jinja | setlocal filetype=jinja
autocmd MyAutoCmd BufReadPre,BufNewFile *.twig packadd vim-twig | setlocal filetype=twig.html
autocmd MyAutoCmd BufReadPre,BufNewFile *.coffee packadd vim-coffee-script | setlocal filetype=coffee
autocmd MyAutoCmd BufReadPre,BufNewFile *.ts,*.tsx packadd tscompletejob | packadd yats.vim | packadd vim-jsx-pretty | setlocal filetype=typescript
autocmd MyAutoCmd BufReadPre,BufNewFile *.js,*.jsx packadd vim-javascript-syntax | packadd vim-jsx-pretty | packadd vim-html-template-literals | set filetype=javascript

"""" jump to the last spot the cursor was at in a file when reading it.
autocmd MyAutoCmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   silent! exe 'normal! g`"zzza' |
      \ endif

"""" If a file is large, disable syntax highlighting, filetype etc
autocmd MyAutoCmd BufReadPre *
      \ let s = getfsize(expand("<afile>")) |
      \ if s > g:LargeFile || s == -2 |
      \   call functions#large_file(fnamemodify(expand("<afile>"), ":p")) |
      \ endif

"""" manage swapfiles
if exists('##CursorHold')
  autocmd MyAutoCmd CursorHold,BufWritePost,BufReadPost,BufLeave *
        \ if !$VIMSWAP && isdirectory(expand('<amatch>:h')) | let &swapfile = &modified | endif
endif

"""" syntax
autocmd MyAutoCmd BufRead * syntax sync fromstart

"""" completion
autocmd MyAutoCmd Syntax javascript setlocal isk+=$
autocmd MyAutoCmd BufRead,BufNewFile *.js,.jsx setlocal dictionary+=$HOME/.vim/dict/javascript.dict
autocmd MyAutoCmd BufRead,BufNewFile *.vim setlocal dictionary+=$HOME/.vim/dict/vim.dict

"""" update diff
autocmd MyAutoCmd InsertLeave * if &l:diff | diffupdate | endif

"""" external changes
autocmd MyAutoCmd FocusGained,CursorHold,CursorHoldI * if !bufexists("[Command Line]") | checktime | GitGutterAll | endif

"""" keep clipboard content
autocmd MyAutoCmd VimLeave * call system("xclip -sel clip -i", getreg('+'))

"""" cursorline
autocmd MyAutoCmd InsertLeave,VimEnter,WinEnter * setlocal cursorline
autocmd MyAutoCmd InsertEnter,WinLeave * setlocal nocursorline

"""" mkdir
autocmd MyAutoCmd BufWritePre * call functions#mkdirifnotexist()

"""" qf and help keep widow full width
autocmd MyAutoCmd FileType qf wincmd J
autocmd MyAutoCmd BufWinEnter * if &ft == 'help' | wincmd J | end

function! autocmds#autocmds() abort
endfunction
