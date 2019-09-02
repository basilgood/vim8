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

" command! -nargs=0 NixFormat Dispatch! nixpkgs-fmt -i %
autocmd VGroup FileType nix let b:dispatch = 'nixpkgs-fmt -i %'
autocmd VGroup BufWrite *.nix Dispatch!
command! -nargs=0 NixFormat Dispatch!

" highlight Conceal guibg=NONE ctermbg=NONE ctermfg=DarkGrey guifg=#5c6370
" autocmd VGroup BufLeave * setlocal conceallevel=0 concealcursor=
" autocmd VGroup BufReadPre * setlocal conceallevel=2 concealcursor=nv
" autocmd VGroup BufReadPre * syntax match LeadingSpace /\(^ *\)\@<= / containedin=ALL conceal cchar=·
