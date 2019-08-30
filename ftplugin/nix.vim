scriptencoding utf-8

setlocal expandtab
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal nospell

let b:ale_linters = ['nix']
let g:ale_fixers = {
      \   'nix': ['nixfmt']
      \}
