scriptencoding utf-8

Plugin 'LnL7/vim-nix'
autocmd vimRc FileType *.nix call vivid#enable('vim-nix')

Plugin 'lumiliet/vim-twig'
autocmd vimRc FileType *.twig call vivid#enable('vim-twig')

Plugin 'lepture/vim-jinja'
autocmd vimRc FileType *.j2 call vivid#enable('vim-jinja')

Plugin 'jelera/vim-javascript-syntax'
autocmd vimRc FileType *.js,.jsx call vivid#enable('vim-javascript-syntax')

Plugin 'MaxMEllon/vim-jsx-pretty'
autocmd vimRc FileType *.js,.jsx call vivid#enable('vim-javascript-syntax')

Plugin 'jonsmithers/vim-html-template-literals'
autocmd vimRc FileType *.js,.jsx call vivid#enable('vim-html-template-literals')

Plugin 'HerringtonDarkholme/yats.vim'
autocmd vimRc FileType *.ts,.tsx call vivid#enable('yats.vim')

Plugin 'tpope/vim-markdown'
autocmd vimRc FileType *.md call vivid#enable('vim-markdown')

Plugin 'kchmck/vim-coffee-script'
autocmd vimRc FileType *.coffee call vivid#enable('vim-coffee-script')

" Plugin 'kana/vim-submode', { 'enabled': 1 }
" if has('vivid#enable')
"   call submode#enter_with('resize', 'n', '', '<C-W>>', '<C-W>>')
"   call submode#enter_with('resize', 'n', '', '<C-W><', '<C-W><')
"   call submode#map('resize', 'n', '', '.', '<C-W>>')
"   call submode#map('resize', 'n', '', ',', '<C-W><')
"   call submode#enter_with('resize', 'n', '', '<C-W>-', '<C-W>-')
"   call submode#enter_with('resize', 'n', '', '<C-W>+', '<C-W>+')
"   call submode#map('resize', 'n', '', '-', '<C-W>-')
"   call submode#map('resize', 'n', '', '=', '<C-W>+')
"   call submode#leave_with('resize', 'n', '', '<Esc>')
"   call submode#enter_with('scroll-h', 'n', '', 'zl', 'zl')
"   call submode#enter_with('scroll-h', 'n', '', 'zh', 'zh')
"   call submode#enter_with('scroll-h', 'n', '', 'zL', 'zL')
"   call submode#enter_with('scroll-h', 'n', '', 'zH', 'zH')
"   call submode#map('scroll-h', 'n', '', 'l', 'zl')
"   call submode#map('scroll-h', 'n', '', 'h', 'zh')
"   call submode#map('scroll-h', 'n', '', 'L', 'zL')
"   call submode#map('scroll-h', 'n', '', 'H', 'zH')
" endif
" autocmd vimRc BufReadPre * call vivid#enable('vim-submode')
" call timer_start(300, {-> vivid#enable('vim-submode')}, {'repeat': 0})
