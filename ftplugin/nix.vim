scriptencoding utf-8

setlocal expandtab
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal nospell

let b:ale_linters = ['nix']
" let b:ale_fixers = {
"       \   'nix': ['nixpkgs-fmt']
"       \}

autocmd AutoCmd FileType nix let b:dispatch = 'nixfmt %'
autocmd AutoCmd BufWritePost *.nix :call functions#runner('nixfmt ')
