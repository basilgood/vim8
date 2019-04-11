" ==============================================================================
"   Name:        Mood
"   Author:      beautiful world
"   Url:         https://
"   License:     free for all
"
"   A dark vim color scheme based on Gruvbox and Onehalfdark.
" ==============================================================================

set background=dark
highlight clear
syntax reset

let g:colors_name='mood'
let colors_name='mood'


let s:black       = { 'gui': '#1d2021', 'cterm': '234' }
let s:red         = { 'gui': '#f93d3d', 'cterm': '196' }
let s:fred        = { 'gui': '#d78787', 'cterm': '' }
let s:bred        = { 'gui': '#af5f5f', 'cterm': '' }
let s:pink        = { 'gui': '#d3869b', 'cterm': '175' }
let s:lightgreen  = { 'gui': '#83a598', 'cterm': '109' }
let s:lgreen      = { 'gui': '#5f875f', 'cterm': '' }
let s:green       = { 'gui': '#8ec07c', 'cterm': '107' }
let s:yellow      = { 'gui': '#fabd2f', 'cterm': '214' }
let s:blue        = { 'gui': '#61afef', 'cterm': '75'  }
let s:orange      = { 'gui': '#fb4934', 'cterm': '203' }
let s:cyan        = { 'gui': '#56b6c2', 'cterm': '73'  }
let s:white       = { 'gui': '#ebdbb2', 'cterm': '187' }

let s:fg          = s:white
let s:bg          = s:black

let s:comment_fg  = { 'gui': '#5c6370', 'cterm': '10'  }
let s:gutter_bg   = { 'gui': '#282c34', 'cterm': '236' }
let s:gutter_fg   = { 'gui': '#919baa', 'cterm': '247' }

let s:cursor_line = { 'gui': '#313640', 'cterm': '237' }
let s:color_col   = { 'gui': '#313640', 'cterm': '237' }

let s:selection   = { 'gui': '#474e5d', 'cterm': '239' }
let s:vertsplit   = { 'gui': '#313640', 'cterm': '237' }


function! s:h(group, fg, bg, attr)
  if type(a:fg) == type({})
    exec 'hi ' . a:group . ' guifg=' . a:fg.gui . ' ctermfg=' . a:fg.cterm
  else
    exec 'hi ' . a:group . ' guifg=NONE cterm=NONE'
  endif
  if type(a:bg) == type({})
    exec 'hi ' . a:group . ' guibg=' . a:bg.gui . ' ctermbg=' . a:bg.cterm
  else
    exec 'hi ' . a:group . ' guibg=NONE ctermbg=NONE'
  endif
  if a:attr !=# ''
    exec 'hi ' . a:group . ' gui=' . a:attr . ' cterm=' . a:attr
  else
    exec 'hi ' . a:group . ' gui=NONE cterm=NONE'
  endif
endfun


" User interface colors {
call s:h('Normal', s:fg, s:bg, '')
call s:h('NonText', s:comment_fg, '', '')

call s:h('Cursor', s:bg, s:blue, '')
call s:h('CursorColumn', '', s:cursor_line, '')
call s:h('CursorLine', '', s:cursor_line, '')

call s:h('LineNr', s:comment_fg, s:gutter_bg, '')
call s:h('CursorLineNr', s:fg, '', '')

call s:h('DiffAdd', s:green, s:bg, 'reverse')
call s:h('DiffChange', s:yellow, s:bg, 'reverse')
call s:h('DiffDelete', s:red, s:bg, 'reverse')
call s:h('DiffText', s:cyan, s:bg, 'reverse')

call s:h('IncSearch', s:bg, s:orange, '')
call s:h('Search', s:bg, s:green, 'bold')

call s:h('ErrorMsg', s:fg, '', '')
call s:h('ModeMsg', s:fg, '', '')
call s:h('MoreMsg', s:fg, '', '')
call s:h('WarningMsg', s:red, '', '')
call s:h('Question', s:orange, '', '')

call s:h('Pmenu', s:bg, s:fg, '')
call s:h('PmenuSel', s:bg, s:blue, '')
call s:h('PmenuSbar', '', s:selection, '')
call s:h('PmenuThumb', '', s:fg, '')

call s:h('SpellBad', s:red, '', '')
call s:h('SpellCap', s:yellow, '', '')
call s:h('SpellLocal', s:yellow, '', '')
call s:h('SpellRare', s:yellow, '', '')

call s:h('StatusLine', s:blue, s:cursor_line, '')
call s:h('StatusLineNC', s:comment_fg, s:cursor_line, '')
call s:h('TabLine', s:comment_fg, s:cursor_line, '')
call s:h('TabLineFill', s:comment_fg, s:cursor_line, '')
call s:h('TabLineSel', s:fg, s:bg, '')

call s:h('Visual', '', s:selection, '')
call s:h('VisualNOS', '', s:selection, '')

call s:h('ColorColumn', '', s:color_col, '')
call s:h('Conceal', s:fg, '', '')
call s:h('Directory', s:blue, '', '')
call s:h('VertSplit', s:vertsplit, s:vertsplit, '')
call s:h('Folded', s:fg, '', '')
call s:h('FoldColumn', s:fg, '', '')
call s:h('SignColumn', s:fg, '', '')

call s:h('MatchParen', s:blue, '', 'underline')
call s:h('SpecialKey', s:comment_fg, '', '')
call s:h('Title', s:green, '', '')
call s:h('WildMenu', s:fg, '', '')
" }


" Syntax colors {
call s:h('Comment', s:comment_fg, '', 'italic')
call s:h('Constant', s:pink, '', '')
call s:h('String', s:green, '', '')
call s:h('Character', s:green, '', '')
call s:h('Number', s:pink, '', '')
call s:h('Boolean', s:yellow, '', '')
call s:h('Float', s:yellow, '', '')

call s:h('Identifier', s:lightgreen, '', '')
call s:h('Function', s:blue, '', '')
call s:h('Statement', s:orange, '', '')

call s:h('Conditional', s:orange, '', '')
call s:h('Repeat', s:orange, '', '')
call s:h('Label', s:orange, '', '')
call s:h('Operator', s:fg, '', '')
call s:h('Keyword', s:orange, '', '')
call s:h('Exception', s:orange, '', '')

call s:h('PreProc', s:yellow, '', '')
call s:h('Include', s:blue, '', '')
call s:h('Define', s:orange, '', '')
call s:h('Macro', s:orange, '', '')
call s:h('PreCondit', s:yellow, '', '')

call s:h('Type', s:yellow, '', '')
call s:h('StorageClass', s:yellow, '', '')
call s:h('Structure', s:yellow, '', '')
call s:h('Typedef', s:yellow, '', '')

call s:h('Special', s:orange, '', 'italic')
call s:h('SpecialChar', s:fg, '', '')
call s:h('Tag', s:fg, '', '')
call s:h('Delimiter', s:fg, '', '')
call s:h('SpecialComment', s:fg, '', '')
call s:h('Debug', s:fg, '', '')
call s:h('Underlined', s:fg, '', '')
call s:h('Ignore', s:fg, '', '')
call s:h('Error', s:red, s:gutter_bg, '')
call s:h('Todo', s:orange, '', '')
" }


" Plugins {
" GitGutter
call s:h('GitGutterAdd', s:green, s:gutter_bg, '')
call s:h('GitGutterDelete', s:red, s:gutter_bg, '')
call s:h('GitGutterChange', s:yellow, s:gutter_bg, '')
call s:h('GitGutterChangeDelete', s:red, s:gutter_bg, '')
" Fugitive
call s:h('diffAdded', s:green, '', '')
call s:h('diffRemoved', s:red, '', '')
" }

" ALE lint
call s:h('ALEWarningSign', s:yellow, s:gutter_bg, '')
call s:h('ALEErrorSign', s:red, s:gutter_bg, '')

" Git {
call s:h('gitcommitComment', s:comment_fg, '', '')
call s:h('gitcommitUnmerged', s:red, '', '')
call s:h('gitcommitOnBranch', s:fg, '', '')
call s:h('gitcommitBranch', s:orange, '', '')
call s:h('gitcommitDiscardedType', s:red, '', '')
call s:h('gitcommitSelectedType', s:green, '', '')
call s:h('gitcommitHeader', s:fg, '', '')
call s:h('gitcommitUntrackedFile', s:cyan, '', '')
call s:h('gitcommitDiscardedFile', s:red, '', '')
call s:h('gitcommitSelectedFile', s:green, '', '')
call s:h('gitcommitUnmergedFile', s:yellow, '', '')
call s:h('gitcommitFile', s:fg, '', '')
" }

" Fix colors in neovim terminal buffers {
if has('nvim')
  let g:terminal_color_0 = s:black.gui
  let g:terminal_color_1 = s:red.gui
  let g:terminal_color_2 = s:green.gui
  let g:terminal_color_3 = s:yellow.gui
  let g:terminal_color_4 = s:blue.gui
  let g:terminal_color_5 = s:orange.gui
  let g:terminal_color_6 = s:cyan.gui
  let g:terminal_color_7 = s:white.gui
  let g:terminal_color_8 = s:black.gui
  let g:terminal_color_9 = s:red.gui
  let g:terminal_color_10 = s:green.gui
  let g:terminal_color_11 = s:yellow.gui
  let g:terminal_color_12 = s:blue.gui
  let g:terminal_color_13 = s:orange.gui
  let g:terminal_color_14 = s:cyan.gui
  let g:terminal_color_15 = s:white.gui
  let g:terminal_color_background = s:bg.gui
  let g:terminal_color_foreground = s:fg.gui
endif
" }

