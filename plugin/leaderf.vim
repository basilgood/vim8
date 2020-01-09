scriptencoding utf-8

let g:Lf_ShortcutF = '<C-P>'
let g:Lf_ShortcutB = '<bs>'
let g:Lf_WindowHeight = 0.25
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewHorizontalPosition = 'center'
let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}

nnoremap <silent> <C-p> :packadd LeaderF<cr>:LeaderfFile<cr>
nnoremap <silent> <C-h> :LeaderfHistoryCmd<cr>
