scriptencoding utf-8

"""" filetype
autocmd vimRc BufRead,BufNewFile *.gitignore  set filetype=gitignore
autocmd vimRc BufNewFile,BufRead *.vim set filetype=vim
autocmd vimRc BufNewFile,BufRead *.nix set filetype=nix
autocmd vimRc BufNewFile,BufRead *.html set filetype=html
autocmd vimRc BufNewFile,BufRead *.yamllint set filetype=yaml
autocmd vimRc BufNewFile,BufRead *.yml set filetype=yaml
autocmd vimRc BufNewFile,BufRead *.vifm,vifmrc set filetype=vim

autocmd vimRc BufRead,BufNewFile *.md,.markdown setlocal filetype=markdown
let g:markdown_fenced_languages = ['html', 'vim', 'javascript', 'python', 'bash=sh', 'nix']

autocmd vimRc BufReadPre,BufNewFile *.j2 setlocal filetype=jinja
autocmd vimRc BufReadPre,BufNewFile *.twig setlocal filetype=twig.html
autocmd vimRc BufReadPre,BufNewFile *.coffee setlocal filetype=coffee
autocmd vimRc BufReadPre,BufNewFile *.ts,*.tsx setlocal filetype=typescript
autocmd vimRc BufReadPre,BufNewFile *.js,*.jsx set filetype=javascript

"""" mouse
autocmd vimRc BufRead,BufNewFile * setlocal ttymouse=sgr

"""" If a file is large, disable syntax highlighting, filetype etc
autocmd vimRc BufReadPre *
      \ let s = getfsize(expand("<afile>")) |
      \ if s > g:LargeFile || s == -2 |
      \   call functions#large_file(fnamemodify(expand("<afile>"), ":p")) |
      \ endif

"""" manage swapfiles
if exists('##CursorHold')
  autocmd vimRc CursorHold,BufWritePost,BufReadPost,BufLeave *
        \ if !$VIMSWAP && isdirectory(expand('<amatch>:h')) | let &swapfile = &modified | endif
endif

"""" don't list location-list / quickfix windows
autocmd vimRc BufReadPost quickfix setlocal nobuflisted
autocmd vimRc BufReadPost quickfix nnoremap <buffer> gq :bd<CR>

"""" syntax
autocmd vimRc BufRead * syntax sync fromstart

"""" completion
autocmd vimRc Syntax javascript setlocal isk+=$
autocmd vimRc FileType * execute 'setlocal dictionary+='.expand($HOME.'/.vim/dict/'.&filetype.'.dict')

"""" update diff
autocmd vimRc InsertLeave * if &l:diff | diffupdate | endif

"""" external changes
autocmd vimRc FocusGained,CursorHold * if !bufexists("[Command Line]") | checktime | endif

"""" keep clipboard content
autocmd vimRc VimLeave * call system("xclip -sel clip -i", getreg('+'))

"""" cursorline
autocmd vimRc InsertLeave,VimEnter,WinEnter * setlocal cursorline
autocmd vimRc InsertEnter,WinLeave * setlocal nocursorline

"""" mkdir
autocmd vimRc BufWritePre * call functions#mkdirifnotexist()

autocmd vimRc BufNewFile,BufRead * call matchadd('SpecialKey', '\s\+')
autocmd vimRc BufNewFile,BufRead * call matchadd('NonText', '\n\+')

"""" sessions
autocmd vimRc VimLeavePre * call sessions#make()

"""" qf and help keep widow full width
autocmd vimRc FileType qf wincmd J
autocmd vimRc BufWinEnter * if &ft == 'help' | wincmd J | end
