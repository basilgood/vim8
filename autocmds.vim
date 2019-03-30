scriptencoding utf-8

"""" filetype
autocmd MyAutoCmd BufRead,BufNewFile * setfiletype txt
autocmd MyAutoCmd BufRead,BufNewFile *.gitignore  set filetype=gitignore
autocmd MyAutoCmd BufNewFile,BufRead *.vim set filetype=vim
autocmd MyAutoCmd BufNewFile,BufRead *.twig set filetype=html.twig
autocmd MyAutoCmd BufNewFile,BufRead *.nix set filetype=nix
autocmd MyAutoCmd BufNewFile,BufRead *.md set filetype=markdown
autocmd MyAutoCmd BufNewFile,BufRead .ledger set filetype=ledger
autocmd MyAutoCmd BufNewFile,BufRead *.j2 set filetype=jinja
autocmd MyAutoCmd BufNewFile,BufRead *.js set filetype=javascript
autocmd MyAutoCmd BufNewFile,BufRead *.html set filetype=html
autocmd MyAutoCmd BufNewFile,BufRead *.fish setlocal filetype=fish
autocmd MyAutoCmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd MyAutoCmd BufNewFile,BufRead *.yamllint set filetype=yaml
autocmd MyAutoCmd BufNewFile,BufRead *.yml set filetype=yaml
autocmd MyAutoCmd BufNewFile,BufRead *.vifm,vifmrc set filetype=vim

" jump to the last spot the cursor was at in a file when reading it.
autocmd MyAutoCmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   silent! exe 'normal! g`"zzza' |
      \ endif

"""" autocompletion
autocmd MyAutoCmd Syntax javascript setlocal isk+=$
autocmd MyAutoCmd FileType javascript setlocal dictionary+=$HOME/.vim/dict/javascript.dict
autocmd MyAutoCmd FileType vim setlocal dictionary+=$HOME/.vim/dict/vim.dict

" update diff
autocmd MyAutoCmd InsertLeave * if &l:diff | diffupdate | endif

" external changes
autocmd MyAutoCmd FocusGained,BufEnter,CursorHold,CursorHoldI * if !bufexists("[Command Line]") | checktime | GitGutter | endif

" keep clipboard content
autocmd MyAutoCmd VimLeave * call system("xclip -sel clip -i", getreg('+'))

" qf and help keep widow full width
autocmd MyAutoCmd FileType qf wincmd J
autocmd MyAutoCmd BufWinEnter * if &ft == 'help' | wincmd J | end
