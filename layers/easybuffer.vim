scriptencoding utf-8

" nnoremap <bs> :call functions#plug('easybuffer.vim')<cr>:EasyBufferHorizontalBelow<cr>

" " let g:easybuffer_botright_height = '&lines/4'
" let g:easybuffer_bufname = "fnamemodify(expand('#'.bnr.'%'), ':~:.')"
" let g:easybuffer_show_header = 0

" function! InEasyBuffer()
"   nnoremap <silent> <buffer> OB j
"   nnoremap <silent> <buffer> OA k
" endfunction

" autocmd MyAutoCmd FileType easybuffer call InEasyBuffer()
nnoremap <bs> :call bufferhint#Popup()<cr>
