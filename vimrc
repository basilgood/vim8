vim9script

runtime defaults.vim
packadd matchit

augroup vimRc
  autocmd!
augroup END

if has('vim_starting')
  const minpac_dir = $HOME .. '/.vim/pack/minpac/opt/minpac'
  if !isdirectory(minpac_dir)
    silent execute '!git clone --depth 1 https://github.com/k-takata/minpac ' .. minpac_dir
  endif
endif

command! PackUpdate PackInit() | minpac#update()
command! PackClean  PackInit() | minpac#clean()
command! -nargs=+ Pack minpac#add(<args>)

def PackInit()
  packadd minpac
  call minpac#init()
  Pack 'k-takata/minpac', {'type': 'opt'}
  Pack 'sgur/vim-editorconfig'
  Pack 'junegunn/fzf.vim', {'type': 'opt'}
  Pack 'neoclide/coc.nvim', {'branch': 'release'}
  Pack 'dense-analysis/ale', {'type': 'opt'}
  Pack 'maxmellon/vim-jsx-pretty'
  Pack 'yuezk/vim-js'
  Pack 'HerringtonDarkholme/yats.vim'
  Pack 'tpope/vim-commentary'
  Pack 'tpope/vim-surround'
  Pack 'tpope/vim-repeat'
  Pack 'tommcdo/vim-exchange'
  Pack 'ubaldot/vim-highlight-yanked'
  Pack 'linjiX/vim-star'
  Pack 'markonm/traces.vim'
  Pack 'sgur/cmdline-completion'
  Pack 'stefandtw/quickfix-reflector.vim'
  Pack 'AndrewRadev/quickpeek.vim'
  Pack 'fcpg/vim-altscreen'
  Pack 'rstacruz/vim-closer'
  Pack 'tpope/vim-fugitive'
  Pack 'airblade/vim-gitgutter'
  Pack 'Eliot00/git-lens.vim'
  Pack 'basilgood/vim-options'
  Pack 'basilgood/oceanic-next'
enddef

# fzf
silent! packadd fzf.vim
$FZF_DEFAULT_COMMAND = 'fd -tf -L -H -E=.git -E=node_modules --strip-cwd-prefix'
g:fzf_layout = {'window': {'width': 0.7, 'height': 0.8, 'border': 'sharp'}}
g:fzf_preview_window = ['up:70%', 'ctrl-/']
nnoremap <c-p> <cmd>Files<cr>
cabbrev ff Files %:p:h
nnoremap <bs> <cmd>Buffers<cr>
nnoremap <leader>g <cmd>Rg<cr>

# coc
g:coc_global_extensions = [
  'coc-tsserver',
  'coc-eslint',
  'coc-lit-html',
  'coc-html-css-support',
  'coc-css',
  'coc-json',
  'coc-markdownlint',
  'coc-vimlsp',
  'coc-snippets',
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
  signature: {target: 'echo'},
  diagnostic: { displayByAle: true },
  html: {
    filetypes: ['html', 'htmldjango', 'astro', 'jinja', 'javascript']
  },
  html-css-support: {
    enabledLanguages: ['html', 'astro', 'jinja', 'javascript'],
  },
  rust-analyzer: {
    checkOnSave: true,
    lens: {enable: true},
    updates: {prompt: true},
    signatureInfo: {detail: 'parameters'},
  },
  markdownlint: {
    config: { 'line-length': false }
  },
  javascript: {
    implementationsCodeLens: { enabled: true },
    referencesCodeLens: { enabled: true, showOnAllFunctions: true },
  },
  typescript: {
    implementationsCodeLens: { enabled: true },
    referencesCodeLens: { enabled: true, showOnAllFunctions: true },
  },
  languageserver: {
    nix: {
      command: 'nil',
      filetypes: [
        'nix'
      ],
    },
  },
}

inoremap <silent><expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "<cr><c-r>=coc#on_enter()<cr>"
def CheckBackspace(): bool
  var col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
enddef
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <F2> <Plug>(coc-rename)
nmap <silent> <F4> <Plug>(coc-codeaction)
nmap <silent> K  <cmd>call CocActionAsync('definitionHover')<cr>
nnoremap <silent><nowait> <leader>d  <cmd>CocList diagnostics<cr>
nnoremap <silent> <leader>c  <cmd>CocCommand<cr>
nnoremap Q <cmd>call CocActionAsync('format')<cr>

command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

# ale
silent! packadd ale
g:ale_disable_lsp = 1
g:ale_virtualtext_cursor = 0
g:lsp_ale_diagnostics_severity = 'hint'
g:ale_sign_error = '🞬'
g:ale_sign_warning = ''
g:ale_sign_info = ''
g:ale_echo_msg_error_str = 'E'
g:ale_echo_msg_warning_str = 'W'
g:ale_echo_msg_info_str = 'I'
g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
g:ale_sh_shfmt_options = '-i 2 -ci -sr'
g:ale_fixers = {
  sh: ['shfmt'],
  javascript: ['prettier'],
  typescript: ['prettier'],
  html: ['prettier'],
  css: ['prettier'],
  json: ['fixjson'],
  nix: ['alejandra'],
  yaml: ['yamlfix'],
  rust: ['rustfmt'],
}
g:al_linters = {
  javascript: [],
  typescript: []
}

nnoremap ]d <Plug>(ale_next_wrap)
nnoremap [d <Plug>(ale_previous_wrap)
nnoremap Q :ALEFix<cr>

# toggle autoformat
def g:ToggleAutoFormat()
  echo 'autoformat ' .. !g:ale_fix_on_save
  g:ale_fix_on_save = !g:ale_fix_on_save
enddef
nnoremap <silent><leader>f <cmd>call ToggleAutoFormat()<cr>

# git
g:gitgutter_sign_priority = 8
g:gitgutter_preview_win_floating = 1
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)
nnoremap ghd :Gvdiffsplit!<cr>
nnoremap <silent> ghb :call ToggleGitLens()<cr>

# lit
g:html_indent_style1 = 'inc'
g:htl_css_templates = 1
g:htl_all_templates = 1

# star
vmap <silent> * <Plug>(star-*)
nmap <silent> * <Plug>(star-*)
nnoremap <silent> gs <Plug>(star-*)cgn
xnoremap <silent> gs <Plug>(star-*)cgn

# traces
g:traces_normal_preview = 1
g:traces_num_range_preview = 1

# quickpeek
g:quickpeek_popup_options = {
  borderchars: ['-', '|', '-', '|', '+', '+', '+', '+'],
}
g:quickpeek_window_settings = ['cursorline', 'number']
autocmd vimRc Filetype qf nnoremap <buffer> <tab> :QuickpeekToggle<cr>

filetype plugin indent on

colorscheme OceanicNext

set secure
