scriptencoding utf-8

let g:Lf_ShortcutF = '<C-P>'
" let g:Lf_ShortcutB = '<Bs>'
let g:Lf_WindowHeight = 0.20
let g:Lf_DefaultMode = 'FullPath'
let g:Lf_FollowLinks = 'yes'
let g:Lf_PreviewCode = 1
    let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg']
            \}

nnoremap <Leader>m :LeaderfMru<CR>
nnoremap <Leader>n :LeaderfMruCwd<CR>
nnoremap <Leader>k :LeaderfHistoryCmd<CR>
