let g:picker_find_executable = 'ag'
let g:picker_split = 'bottomright'
let g:picker_height = 10
let g:picker_selector_flags = ''
let g:picker_find_flags = '--color never --files'
nnoremap <C-p> :PickerEdit<CR>
nnoremap <Bs> :PickerBuffer<CR>
