scriptencoding utf-8

"""" filetype
autocmd AutoCmd BufRead,BufNewFile *.gitignore  set filetype=gitignore
autocmd AutoCmd BufNewFile,BufRead *.vim set filetype=vim
autocmd AutoCmd BufNewFile,BufRead *.nix set filetype=nix
autocmd AutoCmd BufNewFile,BufRead *.html set filetype=html
autocmd AutoCmd BufNewFile,BufRead *.yamllint set filetype=yaml
autocmd AutoCmd BufNewFile,BufRead *.yml set filetype=yaml
autocmd AutoCmd BufNewFile,BufRead *.vifm,vifmrc set filetype=vim

autocmd AutoCmd BufRead,BufNewFile *.md,.markdown setlocal filetype=markdown
let g:markdown_fenced_languages = ['html', 'vim', 'javascript', 'python', 'bash=sh', 'nix']

autocmd AutoCmd BufReadPre,BufNewFile *.j2 setlocal filetype=jinja
autocmd AutoCmd BufReadPre,BufNewFile *.twig setlocal filetype=twig.html
autocmd AutoCmd BufReadPre,BufNewFile *.coffee setlocal filetype=coffee
autocmd AutoCmd BufReadPre,BufNewFile *.ts,*.tsx setlocal filetype=typescript
autocmd AutoCmd BufReadPre,BufNewFile *.js,*.jsx set filetype=javascript
autocmd AutoCmd BufReadPre,BufNewFile * setlocal ttymouse=sgr

"""" If a file is large, disable syntax highlighting, filetype etc
autocmd AutoCmd BufReadPre *
      \ let s = getfsize(expand("<afile>")) |
      \ if s > g:LargeFile || s == -2 |
      \   call functions#large_file(fnamemodify(expand("<afile>"), ":p")) |
      \ endif

"""" manage swapfiles
autocmd AutoCmd SwapExists * call lf_buffer#swap_exists(expand("<afile>"))

"""" don't list location-list / quickfix windows
autocmd AutoCmd BufReadPost quickfix setlocal nobuflisted
autocmd AutoCmd BufReadPost quickfix nnoremap <buffer> gq :bd<CR>

"""" syntax
autocmd AutoCmd BufRead * syntax sync fromstart

"""" completion
autocmd AutoCmd Syntax javascript setlocal isk+=$
autocmd AutoCmd FileType * execute 'setlocal dictionary+='.expand($HOME.'/.vim/dict/'.&filetype.'.dict')

"""" update diff
autocmd AutoCmd InsertLeave * if &l:diff | diffupdate | endif

"""" external changes
autocmd AutoCmd FocusGained,CursorHold * if !bufexists("[Command Line]") | checktime | endif

"""" keep clipboard content
autocmd AutoCmd VimLeave * call system("xclip -sel clip -i", getreg('+'))

"""" cursorline
autocmd AutoCmd InsertLeave,VimEnter,WinEnter * setlocal cursorline
autocmd AutoCmd InsertEnter,WinLeave * setlocal nocursorline

"""" mkdir
autocmd AutoCmd BufWritePre * call functions#mkdirifnotexist()

autocmd AutoCmd BufNewFile,BufRead * call matchadd('SpecialKey', '\s\+')
autocmd AutoCmd BufNewFile,BufRead * call matchadd('NonText', '\n\+')

"""" sessions
autocmd AutoCmd VimLeavePre * call sessions#make()

"""" qf and help keep widow full width
autocmd AutoCmd FileType qf wincmd J
autocmd AutoCmd BufWinEnter * if &ft == 'help' | wincmd J | end

function! autocmds#autocmds() abort
endfunction
