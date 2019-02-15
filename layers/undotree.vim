scriptencoding utf-8

let g:undotree_WindowLayout = 4
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
command! -nargs=* Undo call plug#plug('undotree') | UndotreeToggle
nnoremap U :Undo<cr>
