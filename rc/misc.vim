scriptencoding utf-8

Plugin 'zhimsel/vim-stay'
autocmd vimRc BufReadPre * call vivid#enable('vim-stay')

Plugin 'romainl/vim-cool'
autocmd vimRc BufReadPre * call vivid#enable('vim-cool')
let g:CoolTotalMatches = 1

Plugin 'gcmt/wildfire.vim'
autocmd vimRc BufReadPre * call vivid#enable('wildfire.vim')
let g:wildfire_objects = [ 'iw', 'il', "i'", "a'", 'i"', 'i)', 'a)', 'i]', 'a]', 'i}', 'a}', 'i<', 'a<', 'ip', 'it']
let g:wildfire_fuel_map = '+'
let g:wildfire_water_map = '-'
nmap <leader>s <Plug>(wildfire-quick-select)

Plugin 'cskeeters/vim-smooth-scroll'
autocmd vimRc BufReadPre * call vivid#enable('vim-smooth-scroll')

Plugin 'tpope/vim-dispatch'
autocmd vimRc BufReadPre * call vivid#enable('vim-dispatch')
