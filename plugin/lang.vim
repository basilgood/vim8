scriptencoding utf-8

Plugin 'LnL7/vim-nix'
autocmd VGroup FileType *.nix call vivid#enable('vim-nix')

Plugin 'lumiliet/vim-twig'
autocmd VGroup FileType *.twig call vivid#enable('vim-twig')

Plugin 'lepture/vim-jinja'
autocmd VGroup FileType *.j2 call vivid#enable('vim-jinja')

Plugin 'jelera/vim-javascript-syntax'
autocmd VGroup FileType *.js,.jsx call vivid#enable('vim-javascript-syntax')

Plugin 'MaxMEllon/vim-jsx-pretty'
autocmd VGroup FileType *.js,.jsx call vivid#enable('vim-javascript-syntax')

Plugin 'jonsmithers/vim-html-template-literals'
autocmd VGroup FileType *.js,.jsx call vivid#enable('vim-html-template-literals')

Plugin 'HerringtonDarkholme/yats.vim'
autocmd VGroup FileType *.ts,.tsx call vivid#enable('yats.vim')

Plugin 'tpope/vim-markdown'
autocmd VGroup FileType *.md call vivid#enable('vim-markdown')

Plugin 'kchmck/vim-coffee-script'
autocmd VGroup FileType *.coffee call vivid#enable('vim-coffee-script')

Plugin 'kana/vim-submode'
if vivid#enable('vim-submode')
  call submode#enter_with('resize', 'n', '', '<C-W>>', '<C-W>>')
  call submode#enter_with('resize', 'n', '', '<C-W><', '<C-W><')
  call submode#map('resize', 'n', '', '.', '<C-W>>')
  call submode#map('resize', 'n', '', ',', '<C-W><')
  call submode#enter_with('resize', 'n', '', '<C-W>-', '<C-W>-')
  call submode#enter_with('resize', 'n', '', '<C-W>+', '<C-W>+')
  call submode#map('resize', 'n', '', '-', '<C-W>-')
  call submode#map('resize', 'n', '', '=', '<C-W>+')
  call submode#leave_with('resize', 'n', '', '<Esc>')
  call submode#enter_with('scroll-h', 'n', '', 'zl', 'zl')
  call submode#enter_with('scroll-h', 'n', '', 'zh', 'zh')
  call submode#enter_with('scroll-h', 'n', '', 'zL', 'zL')
  call submode#enter_with('scroll-h', 'n', '', 'zH', 'zH')
  call submode#map('scroll-h', 'n', '', 'l', 'zl')
  call submode#map('scroll-h', 'n', '', 'h', 'zh')
  call submode#map('scroll-h', 'n', '', 'L', 'zL')
  call submode#map('scroll-h', 'n', '', 'H', 'zH')
endif
autocmd VGroup BufReadPre * call vivid#enable('vim-submode')
