scriptencoding utf-8

Plugin 'lifepillar/vim-mucomplete'
autocmd VGroup InsertEnter * call vivid#enable('vim-mucomplete')
let g:mucomplete#always_use_completeopt = 1
