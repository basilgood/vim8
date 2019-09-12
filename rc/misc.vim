scriptencoding utf-8

Plugin 'zhimsel/vim-stay'
autocmd vimRc BufReadPre * call vivid#enable('vim-stay')

Plugin 'romainl/vim-cool'
autocmd vimRc BufReadPre * call vivid#enable('vim-cool')
let g:CoolTotalMatches = 1

Plugin 'terryma/vim-expand-region'
autocmd vimRc BufReadPre * call vivid#enable('vim-expand-region')
let g:expand_region_text_objects = {
      \ 'iw'  :0,
      \ 'iW'  :0,
      \ 'i"'  :0,
      \ 'i''' :0,
      \ 'i]'  :1,
      \ 'ib'  :1,
      \ 'iB'  :1,
      \ 'il'  :1,
      \ 'ip'  :1,
      \ 'ie'  :1,
      \ 'a]'  :1,
      \ 'ab'  :1,
      \ 'aB'  :1,
      \ }

Plugin 'cskeeters/vim-smooth-scroll'
autocmd vimRc BufReadPre * call vivid#enable('vim-smooth-scroll')

Plugin 'tpope/vim-dispatch'
autocmd vimRc BufReadPre * call vivid#enable('vim-dispatch')
