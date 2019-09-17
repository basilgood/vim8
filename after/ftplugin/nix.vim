scriptencoding utf-8

setlocal expandtab
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal nospell

let b:ale_linters = ['nix']

autocmd vimRc FileType nix let b:dispatch = 'nixfmt %'
autocmd vimRc BufWritePost *.nix :call functions#runner('nixfmt ')
command! -nargs=0 NixFormat silent! terminal ++close nixfmt %
