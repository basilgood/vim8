scriptencoding utf-8

setlocal expandtab
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal nospell

let b:ale_linters = ['nix']
let b:ale_fixers = {
      \   'nix': ['nixpkgs-fmt']
      \}

autocmd VGroup FileType nix let b:dispatch = 'nixfmt %'
" autocmd VGroup BufWritePost *.nix silent! Dispatch!
command! NixFormat Dispatch!

highlight Conceal guibg=NONE ctermbg=NONE ctermfg=DarkGrey guifg=#484848
autocmd VGroup BufReadPre,BufWinEnter *.nix setlocal conceallevel=2 concealcursor=nv
autocmd VGroup BufReadPre,BufWinEnter *.nix syntax match LeadingSpace /\(^ *\)\@<= / containedin=ALL conceal cchar=·
