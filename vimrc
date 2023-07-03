vim9script
runtime defaults.vim
runtime! macros/matchit.vim

augroup vimRc
  autocmd!
augroup END

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release', 'on': []}
Plug 'dense-analysis/ale'

Plug 'pangloss/vim-javascript'
Plug 'jonsmithers/vim-html-template-literals'
Plug 'LnL7/vim-nix'
Plug 'rust-lang/rust.vim'

Plug 'sgur/vim-editorconfig'

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-commentary'
Plug 'yaocccc/vim-comment'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'ubaldot/vim-highlight-yanked'
Plug 'tommcdo/vim-exchange'
Plug 'linjiX/vim-star'
Plug 'markonm/traces.vim'
Plug 'sgur/cmdline-completion'
Plug 'fcpg/vim-altscreen'

Plug 'stefandtw/quickfix-reflector.vim'
Plug 'AndrewRadev/quickpeek.vim'

Plug 'basilgood/vim-options'
Plug 'basilgood/cinnamon-vim'
plug#end()

# fzf
$FZF_DEFAULT_COMMAND = 'fd -tf -L -H -E=.git -E=node_modules --strip-cwd-prefix'
g:fzf_layout = {'window': {'width': 0.7, 'height': 0.8, 'border': 'sharp'}}
g:fzf_preview_window = ['up:70%', 'ctrl-/']
nnoremap <c-p> :Files<cr>
cabbrev ff Files %:p:h
nnoremap <bs> :Buffers<cr>

# coc.nvim
autocmd vimRc BufReadPost * plug#load('coc.nvim')
g:coc_global_extensions = [
  'coc-tsserver',
  'coc-css',
  'coc-html',
  'coc-rust-analyzer',
  'coc-vimlsp',
  'coc-json',
  'coc-snippets',
  'coc-git',
]

g:coc_user_config = {
  coc: {
    preferences: {
      enableMessageDialog: true,
      useQuickfixForLocations: true
    },
  },
  suggest: {
    noselect: true,
    enablePreselect: false,
    insertMode: 'replace',
    detailField: 'abbr'
  },
  workspace: {
    ignoredFolders: ['$HOME', '$HOME/.cargo/**', '$HOME/.rustup/**', '/nix/store/**'],
  },
  signature: {target: 'echo'},
  diagnostic: {displayByAle: v:true},
  html: {
    filetypes: ['html', 'htmldjango', 'astro', 'jinja', 'javascript']
  },
  html-css-support: {
    enabledLanguages: ['html', 'htmldjango', 'astro', 'jinja', 'javascript'],
  },
  rust-analyzer: {
    checkOnSave: true,
    lens: {enable: true},
    updates: {prompt: true},
    signatureInfo: {detail: 'parameters'},
    inlayHints: {
      typeHints: {enable: false},
      parameterHints: {enable: false},
      chainingHints: {enable: false},
    },
  },
  markdownlint: {
    config: { 'line-length': false }
  },
  git: {
    addGBlameToVirtualText: true,
    signPriority: 8,
    floatConfig: { border: true }
  }
}

g:coc_git_hide_blame_virtual_text = 1
def g:ToggleBlame()
  g:coc_git_hide_blame_virtual_text = !get(g:, 'coc_git_hide_blame_virtual_text', 0)
enddef

nnoremap <silent> ghb :call ToggleBlame()<cr>
nmap [c <Plug>(coc-git-prevchunk)
nmap ]c <Plug>(coc-git-nextchunk)
nmap ghp <Plug>(coc-git-chunkinfo)
nnoremap ghu :CocCommand git.chunkUndo<cr>
nnoremap <silent> <leader>g  :<C-u>CocList --normal gstatus<CR>
inoremap <silent><expr> <tab> coc#pum#visible() ? coc#pum#next(1) : '<tab>'
inoremap <expr><s-tab> coc#pum#visible() ? coc#pum#prev(1) : "<c-h>"
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "<cr><c-r>=coc#on_enter()<cr>"
g:coc_snippet_next = '<c-l>'
g:coc_snippet_prev = '<c-h>'

nmap gd <Plug>(coc-definition)
nmap gy <Plug>(coc-type-definition)
nmap <leader>r <Plug>(coc-references)
nmap K :call CocAction('doHover')<cr>
nmap <c-k> :call CocAction('showSignatureHelp')<cr>
nmap <F2> <Plug>(coc-rename)
nmap <F3> <Plug>(coc-refactor)
nmap <F4> <Plug>(coc-codeaction-line)
nmap <F5> <Plug>(coc-codeaction)
nmap <leader>d <cmd>CocDiagnostics<cr>

command! -nargs=0 OI call CocAction('runCommand', 'editor.action.organizeImport')

# ale
g:ale_completion_enabled = 0
g:ale_disable_lsp = 1
g:ale_virtualtext_cursor = 0
g:ale_echo_msg_format = '[%linter%]: %s'
g:ale_sh_shfmt_options = '-i 2 -ci -sr'
g:ale_fixers = {
  sh: ['shfmt'],
  javascript: ['prettier'],
  html: ['prettier'],
  css: ['prettier'],
  json: ['fixjson'],
  nix: ['alejandra'],
  yaml: ['yamlfix'],
  rust: ['rustfmt'],
}

nnoremap ]d <Plug>(ale_next_wrap)
nnoremap [d <Plug>(ale_previous_wrap)
nnoremap Q :ALEFix<cr>

# toggle autoformat
def g:ToggleAutoFormat()
  g:ale_fix_on_save = !g:ale_fix_on_save
  echo 'autoformat ' .. g:ale_fix_on_save
enddef
nnoremap <silent><leader>f :call ToggleAutoFormat()<cr>

# lit
g:html_indent_style1 = 'inc'
g:htl_css_templates = 1
g:htl_all_templates = 1

# star
vmap <silent> * <Plug>(star-*)
nmap <silent> * <Plug>(star-*)
nnoremap <silent> gs <Plug>(star-*)cgn
xnoremap <silent> gs <Plug>(star-*)cgn

# block comments
xmap <silent> ?  :<c-u>CToggleComment<CR>
smap <silent> ?  <c-g>:<c-u>CToggleComment<CR>

# quickpeek
g:quickpeek_popup_options = {
  borderchars: ['-', '|', '-', '|', '+', '+', '+', '+'],
}
g:quickpeek_window_settings = ['cursorline', 'number']
autocmd vimRc Filetype qf nnoremap <buffer> <tab> :QuickpeekToggle<cr>

# colorscheme
colorscheme gruvbox8

set secure
