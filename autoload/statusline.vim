scriptencoding utf-8

let g:lightline = {
      \ 'colorscheme': 'gruvbox_material',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['gitbranch'], ['cocstatus', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo'],
      \              [ 'filetype' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ ['filename'] ],
      \   'right': [ [ ], [ ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"\ue0a2":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"\uff0b":&modifiable?"":"-"}',
      \   'filename': '%{LightLineFilename()}',
      \   'gitbranch': '%{exists("*fugitive#head")?fugitive#head():""}',
      \   'cocstatus': '%{LightLineCoc()}',
      \   'lineinfo': '%3c:%-2l/%L'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'lineinfo': 'percentage'
      \ },
      \ 'separator': { 'left': "\ue0b8", 'right': "\ue0be" },
      \ 'subseparator': { 'left': "\ue0b9", 'right': "\ue0b9" }
      \ }

function! LightLineFilename()
  return ('' !=# expand('%') ? expand('%:t') : '[No Name]')
endfunction

function! LightLineCoc()
    if empty(get(g:, 'coc_status', '')) && empty(get(b:, 'coc_diagnostic_info', {}))
        return ''
    endif
    return trim(coc#status())
endfunction

function! statusline#statusline() abort
endfunction
