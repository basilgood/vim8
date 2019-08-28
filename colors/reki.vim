"------------------------------------------------------------
" Name: reki.vim
" Description: desolate colorscheme for vim.
" Maintainer: machakann
"------------------------------------------------------------

highlight clear
if exists('syntax_on')
    syntax reset
endif
let g:colors_name = 'reki'

function! s:set() abort
  let none           = {'gui': 'NONE',      'cterm': 'NONE'}
  let bold           = {'gui': 'bold',      'cterm': 'bold'}
  let italic         = {'gui': 'italic',    'cterm': 'italic'}
  let underline      = {'gui': 'underline', 'cterm': 'underline'}
  let undercurl      = {'gui': 'undercurl', 'cterm': 'underline'}
  let boldunderline  = {'gui': 'bold,underline', 'cterm': 'bold,underline'}

  let highlight_group = {}
  " Palette
  let gray1       = {'gui': '#222222', 'cterm': '234'}
  let gray2       = {'gui': '#292929', 'cterm': '235'}
  let gray3       = {'gui': '#3e3e3e', 'cterm': '237'}
  let gray4       = {'gui': '#484848', 'cterm': '241'}
  let gray5       = {'gui': '#898989', 'cterm': '245'}
  let gray6       = {'gui': '#c1c1b3', 'cterm': '249'}
  let white       = {'gui': '#ffffff', 'cterm': '15'}
  let green       = {'gui': '#88a537', 'cterm': '106'}
  let cyan        = {'gui': '#76aaa4', 'cterm': '73'}
  let blue        = {'gui': '#5491c0', 'cterm': '32'}
  let purple      = {'gui': '#8b7bb5', 'cterm': '104'}
  let pink        = {'gui': '#b0507c', 'cterm': '133'}
  let brown       = {'gui': '#ad826b', 'cterm': '95'}
  let darkcyan    = {'gui': '#4d6b67', 'cterm': '24'}
  let darkblue    = {'gui': '#405260', 'cterm': '19'}
  let darkpurple  = {'gui': '#574c74', 'cterm': '61'}
  let cursorblue  = {'gui': '#69c4ff', 'cterm': '75'}
  let cursorpink  = {'gui': '#db81aa', 'cterm': '171'}
  let lightyellow = {'gui': '#c0c040', 'cterm': '3'}
  let lightgreen  = {'gui': '#3dab53', 'cterm': '2'}
  let lightred    = {'gui': '#ff3333', 'cterm': '1'}
  let lightcyan   = {'gui': '#00eeff', 'cterm': '73'}
  let lightpink   = {'gui': '#b04656', 'cterm': '125'}
  let paleyellow  = {'gui': '#d9d1af', 'cterm': '187'}
  let palegreen   = {'gui': '#7aae2e', 'cterm': '71'}
  let paleblue    = {'gui': '#4987d3', 'cterm': '75'}
  let palepink    = {'gui': '#4987d3', 'cterm': '75'}
  let palered     = {'gui': '#cb5151', 'cterm': '167'}
  let PMlightblue = {'gui': '#a8b9c6', 'cterm': '153'}
  let PMblue      = {'gui': '#586976', 'cterm': '67'}

  "*** highlight groups (:h highlight-groups) ***"
  " fundamental
  let highlight_group.Normal                      = [gray6,       gray2,       none,          none]
  let highlight_group.Visual                      = [none,        darkblue,    none,          none]
  let highlight_group.VisualNOS                   = [none,        darkcyan,    none,          none]
  " Cursor
  let highlight_group.Cursor                      = [gray2,       cursorblue,  none,          none]
  let highlight_group.CursorIM                    = [gray6,       cursorpink,  none,          none]
  let highlight_group.CursorLine                  = [none,        gray3,       none,          none]
  let highlight_group.CursorColumn                = highlight_group.CursorLine
  " Statusline
  let highlight_group.StatusLine                  = [gray2,       gray5,       bold,          none]
  let highlight_group.StatusLineNC                = [gray4,       gray1,       none,          none]
  let highlight_group.WildMenu                    = [gray2,       paleyellow,  none,          none]
  let highlight_group.StatusLineTerm              = highlight_group.StatusLine
  let highlight_group.StatusLineTermNC            = highlight_group.StatusLineNC
  " Sidebar
  let highlight_group.LineNr                      = [gray4,       gray1,       none,          none]
  let highlight_group.CursorLineNr                = [paleyellow,  gray4,       none,          none]
  let highlight_group.FoldColumn                  = [gray5,       gray3,       none,          none]
  let highlight_group.SignColumn                  = [green,       gray1,       none,          none]
  let highlight_group.VertSplit                   = highlight_group.StatusLineNC
  let highlight_group.ColorColumn                 = [none,        darkcyan,    none,          none]
  " Fold
  let highlight_group.Folded                      = [gray5,       gray3,       none,          none]
  " Tabline
  let highlight_group.TabLineSel                  = highlight_group.WildMenu
  let highlight_group.TabLine                     = highlight_group.StatusLine
  let highlight_group.TabLineFill                 = [none,        gray2,       none,          none]
  " Search
  let highlight_group.Search                      = [white,      darkpurple,   none,          none]
  let highlight_group.IncSearch                   = [paleyellow, pink,         none,          none]
  " Message
  let highlight_group.ErrorMsg                    = [lightred,    none,        none,          none]
  let highlight_group.ModeMsg                     = [brown,       none,        bold,          none]
  let highlight_group.MoreMsg                     = [green,       none,        bold,          none]
  let highlight_group.Question                    = [purple,      none,        bold,          none]
  let highlight_group.Title                       = [green,       none,        none,          none]
  let highlight_group.WarningMsg                  = [lightyellow, none,        none,          none]
  " Completion
  let highlight_group.Pmenu                       = [gray6,       darkblue,    none,          none]
  let highlight_group.PmenuSel                    = [gray2,       PMlightblue, none,          none]
  let highlight_group.PmenuSbar                   = [gray2,       gray5,       none,          none]
  let highlight_group.PmenuThumb                  = [gray2,       gray3,       none,          none]
  " Diff
  let highlight_group.DiffAdd                     = [lightgreen,  gray1,       none,          none]
  let highlight_group.DiffChange                  = [lightyellow, gray1,       none,          none]
  let highlight_group.DiffDelete                  = [lightpink,   gray1,       none,          none]
  let highlight_group.DiffText                    = [lightyellow, gray1,       underline,     none]
  " Miscellaneous
  let highlight_group.Directory                   = [blue,        none,        none,          none]
  let highlight_group.NonText                     = [gray4,       none,        none,          none]
  let highlight_group.SpecialKey                  = [darkcyan,    none,        none,          none]
  let highlight_group.Conceal                     = [gray4,       none,        none,          none]
  let highlight_group.QuickFixLine                = [purple,       none,       none,          none]

  "*** Syntax groups (:h group-name) ***"
  let highlight_group.Comment                     = [gray5,       none,        italic,        none]
  let highlight_group.Constant                    = [green,       none,        none,          none]
  let highlight_group.Identifier                  = [cyan,        none,        none,          none]
  let highlight_group.Statement                   = [blue,        none,        none,          none]
  let highlight_group.PreProc                     = [brown,       none,        none,          none]
  let highlight_group.Type                        = [pink,        none,        none,          none]
  let highlight_group.Special                     = [purple,      none,        none,          none]
  let highlight_group.Underlined                  = [lightcyan,   none,        underline,     none]
  let highlight_group.Ignore                      = [gray4,       none,        none,          none]
  let highlight_group.Error                       = [lightred,    none,        undercurl,     lightred]
  let highlight_group.Todo                        = [lightyellow, none,        underline,     none]
  let highlight_group.diffAdded                   = [green,       none,        none,          none]
  let highlight_group.diffChanged                 = [lightyellow, none,        none,          none]
  let highlight_group.diffRemoved                 = [lightred,    none,        none,          none]

  "*** Settings for plugin ***"
  let highlight_group.MatchParen                  = [none,        gray4,       boldunderline, none]
  let highlight_group.SwapCurrentItem             = [white,       green,       underline,     none]
  let highlight_group.SwapSelectedItem            = [white,       cyan,        underline,     none]
  let highlight_group.SwapItem                    = [white,       none,        underline,     none]
  let highlight_group.HighlightedyankRegion       = [none,        gray4,       none,          none]
  let highlight_group.OperatorSandwichChange      = [white,       palegreen,   none,          none]
  let highlight_group.OperatorSandwichDelete      = [white,       palered,     none,          none]
  let highlight_group.OperatorSandwichAdd         = [white,       paleblue,    none,          none]
  let highlight_group.uniteStatusHead             = [blue,        gray1,       none,          none]
  let highlight_group.uniteStatusSourceNames      = [purple,      gray1,       none,          none]
  let highlight_group.uniteStatusSourceCandidates = [pink,        gray1,       none,          none]
  let highlight_group.uniteStatusMessage          = [gray5,       gray1,       italic,        none]
  let highlight_group.uniteStatusLineNR           = [brown,       gray1,       none,          none]
  let highlight_group.ALEWarningSign              = [lightyellow, gray1,       none,          none]
  let highlight_group.ALEErrorSign                = [lightred,    gray1,       none,          none]

  let bg_none    = {'gui': gray2.gui, 'cterm': 'NONE'}

  if get(g:, 'colorscheme_no_background', 0)
    let highlight_group.Normal[1]      = bg_none
    let highlight_group.TabLineFill[1] = bg_none
    let highlight_group.VertSplit[1]   = bg_none
    let highlight_group.SignColumn[1]  = bg_none
  endif

  if get(g:, 'colorscheme_no_italic', 0)
    let italic.gui = 'NONE'
    let italic.cterm = 'NONE'
  endif

  for [group, colors] in items(highlight_group)
    execute printf('highlight %s guifg=%s guibg=%s gui=%s, guisp=%s ctermfg=%s ctermbg=%s cterm=%s',
                \  group,
                \  colors[0]['gui'],
                \  colors[1]['gui'],
                \  colors[2]['gui'],
                \  colors[3]['gui'],
                \  colors[0]['cterm'],
                \  colors[1]['cterm'],
                \  colors[2]['cterm']
                \ )
  endfor
endfunction
call s:set()
