scriptencoding utf-8

"""" filetype
autocmd VGroup BufRead,BufNewFile *.gitignore  set filetype=gitignore
autocmd VGroup BufNewFile,BufRead *.vim set filetype=vim
autocmd VGroup BufNewFile,BufRead *.nix set filetype=nix
autocmd VGroup BufNewFile,BufRead *.html set filetype=html
autocmd VGroup BufNewFile,BufRead *.yamllint set filetype=yaml
autocmd VGroup BufNewFile,BufRead *.yml set filetype=yaml
autocmd VGroup BufNewFile,BufRead *.vifm,vifmrc set filetype=vim

autocmd VGroup BufRead,BufNewFile *.md,.markdown packadd vim-markdown
let g:markdown_fenced_languages = ['html', 'vim', 'javascript', 'python', 'bash=sh', 'nix']

autocmd VGroup BufReadPre,BufNewFile *.j2 packadd vim-jinja | setlocal filetype=jinja
autocmd VGroup BufReadPre,BufNewFile *.twig packadd vim-twig | setlocal filetype=twig.html
autocmd VGroup BufReadPre,BufNewFile *.coffee packadd vim-coffee-script | setlocal filetype=coffee
autocmd VGroup BufReadPre,BufNewFile *.ts,*.tsx packadd yats.vim | packadd vim-jsx-pretty | setlocal filetype=typescript
autocmd VGroup BufReadPre,BufNewFile *.js,*.jsx packadd vim-javascript-syntax | packadd vim-jsx-pretty | packadd vim-html-template-literals | set filetype=javascript

"""" If a file is large, disable syntax highlighting, filetype etc
autocmd VGroup BufReadPre *
      \ let s = getfsize(expand("<afile>")) |
      \ if s > g:LargeFile || s == -2 |
      \   call functions#large_file(fnamemodify(expand("<afile>"), ":p")) |
      \ endif

"""" manage swapfiles
if exists('##CursorHold')
  autocmd VGroup CursorHold,BufWritePost,BufReadPost,BufLeave *
        \ if !$VIMSWAP && isdirectory(expand('<amatch>:h')) | let &swapfile = &modified | endif
endif

"""" don't list location-list / quickfix windows
autocmd VGroup BufReadPost quickfix setlocal nobuflisted
autocmd VGroup BufReadPost quickfix nnoremap <buffer> gq :bd<CR>

"""" syntax
autocmd VGroup BufRead * syntax sync fromstart

"""" completion
autocmd VGroup Syntax javascript setlocal isk+=$
autocmd VGroup BufRead,BufNewFile *.js,.jsx setlocal dictionary+=$HOME/.vim/dict/javascript.dict
autocmd VGroup BufRead,BufNewFile *.vim setlocal dictionary+=$HOME/.vim/dict/vim.dict

"""" update diff
autocmd VGroup InsertLeave * if &l:diff | diffupdate | endif

"""" external changes
autocmd VGroup FocusGained,CursorHold,CursorHoldI * if !bufexists("[Command Line]") | checktime | GitGutterAll | endif

"""" keep clipboard content
autocmd VGroup VimLeave * call system("xclip -sel clip -i", getreg('+'))

"""" cursorline
autocmd VGroup InsertLeave,VimEnter,WinEnter * setlocal cursorline
autocmd VGroup InsertEnter,WinLeave * setlocal nocursorline

"""" mkdir
autocmd VGroup BufWritePre * call functions#mkdirifnotexist()

autocmd VGroup BufNewFile,BufRead * call matchadd('SpecialKey', '\s\+')
autocmd VGroup BufNewFile,BufRead * call matchadd('NonText', '\n\+')

"""" sessions
autocmd VGroup VimLeavePre * call sessions#make()

"""" qf and help keep widow full width
autocmd VGroup FileType qf wincmd J
autocmd VGroup BufWinEnter * if &ft == 'help' | wincmd J | end

"""" format quickfix
autocmd VGroup BufReadPost quickfix call qfix#format()

function! autocmds#autocmds() abort
endfunction
