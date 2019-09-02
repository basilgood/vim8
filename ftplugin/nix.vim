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
