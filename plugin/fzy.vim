scriptencoding utf-8

nnoremap <c-p> :call functions#fzycommand("fd --type f --hidden --exclude '.git' .", ":e")<cr>
