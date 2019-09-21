scriptencoding utf-8

let g:lightline = {
      \ 'colorscheme': 'gruvbox_material',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['gitbranch', 'readonly', 'filename', 'modified'] ],
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
  return ('' !=# expand('%') ? expand('%') : '[No Name]')
endfunction

function! statusline#statusline() abort
endfunction
