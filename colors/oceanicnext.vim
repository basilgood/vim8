" ==============================================================================
" Name: Oceanic Next
" Description: Adaptation of the Oceanic Next color palette for (Neo)Vim
" Repository: https://github.com/adrian5/oceanic-next-vim
" License: MIT
" ==============================================================================

" ==============================================================================
" ***** Setup ******************************************************************
" ==============================================================================
" {{{

" ----- Init --------------------------------------------------------------- {{{

highlight clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'oceanicnext'
set background=dark

" }}}

" ----- Config ------------------------------------------------------------- {{{

let s:config = {}
let s:config.gutter_like_bg = get(g:, 'oceanic_gutter_like_bg', 0)
let s:config.italic_comments = get(g:, 'oceanic_italic_comments', 0)
let s:config.transparent_bg = get(g:, 'oceanic_transparent_bg', 0)
if get(g:, 'oceanic_bold', 1)
  let s:bold = 'bold,'
  " NOTE: vim gracefully handles trailing commas in assigned values
else
  let s:bold = ''
endif

" }}}

" ----- Highlight Function ------------------------------------------------- {{{

" NOTE: A different function is used based on terminal support. This simplifies
" logic and evades potential issues with `guisp` support. Arguments are
" positional; setting `gui` or `guisp` requires setting all preceding arguments!
"
" Usage: s:HL(target, fg[2], bg[2], gui, guisp[2])

if (has('termguicolors') && &termguicolors) || has('gui_running')
  function! s:HL(target, fg, ...) abort
    let hls = [
      \ 'hi', a:target,
      \ 'guifg=' . a:fg[0]
    \ ]

    " Background
    if a:0 >= 1
      call add(hls, 'guibg=' . a:1[0])
    else
      call add(hls, 'guibg=NONE')
    endif

    " Text-style (see `:h attr-list`)
    if a:0 >= 2 && strlen(a:2)
      call add(hls, 'cterm=' . a:2 . ' gui=' . a:2)
      " NOTE: `cterm` applies to modern terminals too, `gui` is for true GUIs.
    else
      call add(hls, 'cterm=NONE gui=NONE')
    endif

    " Coloring of undercurl/line
    if a:0 >= 3
      call add(hls, 'guisp=' . a:3[0])
    endif

    execute join(hls, ' ')
  endfunction
else " 256-color term (assume no `guisp` support)
  function! s:HL(target, fg, ...) abort
    let hls = [
      \ 'hi', a:target,
      \ 'ctermfg=' . a:fg[1]
    \ ]

    ' Background
    if a:0 >= 1
      call add(hls, 'ctermbg=' . a:1[1])
    else
      call add(hls, 'ctermbg=NONE')
    endif

    ' Text-style
    if a:0 >= 2 && strlen(a:2)
      call add(hls, 'cterm=' . a:2)
    else
      call add(hls, 'cterm=NONE')
    endif

    execute join(hls, ' ')
  endfunction
endif

" }}}

" ========================================================================== }}}



" ==============================================================================
" ***** Oceanic Colors *********************************************************
" ==============================================================================
" {{{

" ----- Oceanic Color Palette ---------------------------------------------- {{{

" Foreground shades
let s:fg1 = ['#405860', 239]
let s:fg2 = ['#4d616b', 240]
let s:fg3 = ['#65737e', 242]
let s:fg4 = ['#adb5c0', 249]
let s:fg5 = ['#99a9c6', 253]
let s:fg  = s:fg5

" Background shades
let s:bg1 = ['#17262e', 233]
let s:bg2 = ['#192932', 234]
let s:bg3 = ['#1b2b34', 235]
let s:bg4 = ['#223642', 236]
let s:bg5 = ['#29414f', 237]
let s:bg  = s:bg3

" Vivid base colors
let s:red    = ['#cc5555', 167]
let s:orange = ['#c77446', 209]
let s:yellow = ['#cc9155', 221]
let s:green  = ['#99c794', 108]
let s:aqua   = ['#5fb3b3',  73]
let s:blue   = ['#5591cc',  68]
let s:lilac  = ['#cc5591', 176]
let s:brown  = ['#cc9155', 138]

" Vivid dark colors
let s:daqua  = ['#4b8a8d', 66]

" Reset
let s:none = ['NONE', 'NONE']

" }}}

" ----- Oceanic Highlight Groups ------------------------------------------- {{{

call s:HL('OcFg', s:fg)
call s:HL('OcFgBold', s:fg, s:none, s:bold)
call s:HL('OcFg1', s:fg1)
call s:HL('OcFg2', s:fg2)
call s:HL('OcFg4', s:fg4)
call s:HL('OcFg4Bold', s:fg4, s:none, s:bold)

call s:HL('OcRed', s:red)
call s:HL('OcRedBold', s:red, s:none, s:bold)
call s:HL('OcOrange', s:orange)
call s:HL('OcOrangeBold', s:orange, s:none, s:bold)
call s:HL('OcYellow', s:yellow)
call s:HL('OcYellowBold', s:yellow, s:none, s:bold)
call s:HL('OcGreen', s:green)
call s:HL('OcGreenBold', s:green, s:none, s:bold)
call s:HL('OcAqua', s:aqua)
call s:HL('OcAquaBold', s:aqua, s:none, s:bold)
call s:HL('OcBlue', s:blue)
call s:HL('OcBlueBold', s:blue, s:none, s:bold)
call s:HL('OcLilac', s:lilac)
call s:HL('OcLilacBold', s:lilac, s:none, s:bold)
call s:HL('OcBrown', s:brown)
call s:HL('OcBrownBold', s:brown, s:none, s:bold)

call s:HL('OcDarkAqua', s:daqua)
call s:HL('OcDarkAquaBold', s:daqua, s:none, s:bold)

" Common Signals
hi! link OcError OcRed
hi! link OcWarning OcYellow
hi! link OcInfo OcBlue
hi! link OcHint OcLilac

" }}}

" ========================================================================== }}}



" ==============================================================================
" ***** Builtin Highlights *****************************************************
" ==============================================================================
" {{{

" ----- Builtin (Editor/UI) ------------------------------------------------ {{{

" See `:help highlight-groups` for reference

if s:config.transparent_bg
  call s:HL('Normal', s:fg)
  call s:HL('Terminal', s:fg)
  call s:HL('EndOfBuffer', s:bg5)
  call s:HL('Folded', ['#4d708c', 24])
  call s:HL('LineNr', s:fg1)
  call s:HL('CursorLineNr', s:fg4)
else
  call s:HL('Normal', s:fg, s:bg)
  call s:HL('Terminal', s:fg, s:bg)
  call s:HL('EndOfBuffer', s:bg5, s:bg)
  call s:HL('Folded', ['#4d708c', 24], ['#1e313b', 235])

  if s:config.gutter_like_bg
    call s:HL('LineNr', s:fg1, s:bg)
    call s:HL('CursorLineNr', s:fg4, s:bg)
  else
    call s:HL('LineNr', s:fg1, s:bg2)
    call s:HL('CursorLineNr', s:fg4, s:bg2)
  endif
endif
hi! link FoldColumn LineNr
hi! link SignColumn LineNr
call s:HL('ColorColumn', s:none, s:bg2)
hi! link Conceal OcLilac
call s:HL('Cursor', s:fg, s:none, 'inverse')
hi! link vCursor Cursor
hi! link iCursor Cursor
hi! link lCursor Cursor
hi! link CursorIM Cursor
call s:HL('CursorLine', s:none, s:bg4)
hi! link CursorColumn CursorLine
call s:HL('DiffAdd', s:none, ['#2d4a46', 22])
call s:HL('DiffChange', s:none, ['#29445a', 23])
call s:HL('DiffDelete', s:none, ['#45353e', 52])
call s:HL('DiffText', s:none, s:bg, 'inverse')
hi! link Directory OcBlue
hi! link ErrorMsg OcRed
hi! link WarningMsg OcYellow
call s:HL('ModeMsg', s:fg)
hi! link MoreMsg ModeMsg
call s:HL('Search', s:none, ['#44496f', 58])
call s:HL('MatchParen', s:none, ['#3c5f73', 66])
call s:HL('Whitespace', s:bg5)
hi! link NonText Whitespace
hi! link SpecialKey Whitespace
call s:HL('Pmenu', s:fg, s:bg4)
hi! link PmenuSbar Pmenu
call s:HL('PmenuSel', s:bg, s:blue)
call s:HL('PmenuThumb', s:none, s:bg5)
hi! link WildMenu PmenuSel
hi! link Question OcBlue
call s:HL('SpellBad', s:red, s:none, 'undercurl', s:red)
call s:HL('SpellCap', s:yellow, s:none, 'undercurl', s:yellow)
call s:HL('SpellLocal', s:blue, s:none, 'undercurl', s:blue)
call s:HL('SpellRare', s:lilac, s:none, 'undercurl', s:lilac)
call s:HL('StatusLine', s:blue, s:bg1)
hi! link StatusLineTerm StatusLine
call s:HL('StatusLineNC', s:fg1, s:bg1)
hi! link StatusLineTermNC StatusLineNC
call s:HL('TabLine', s:fg2, s:bg1, s:bold)
call s:HL('TabLineFill', s:fg4, s:bg1, s:bold)
call s:HL('TabLineSel', ['#bdc2cc', 250], s:bg, s:bold)
call s:HL('VertSplit', s:bg, s:bg1)
call s:HL('Visual', s:none, s:bg4)
hi! link VisualNOS Visual

" :checkhealth
hi! link healthError OcRedBold
hi! link healthWarning OcYellowBold
hi! link healthSuccess OcGreenBold

" }}}

" ----- Builtin (Syntax) --------------------------------------------------- {{{

" See `:help group-name` for reference

if s:config.italic_comments
  call s:HL('Comment', s:fg3, s:none, 'italic')
  call s:HL('SpecialComment', ['#a5abb8', 248], s:none, 'italic')
  call s:HL('Todo', s:fg4, s:bg5, s:bold . 'italic')
else
  call s:HL('Comment', s:fg3)
  call s:HL('SpecialComment', ['#a5abb8', 248])
  call s:HL('Todo', s:fg4, s:bg5, s:bold)
endif

call s:HL('Underlined', s:none, s:none, 'underline')
hi! link Boolean OcRed
hi! link Character String
hi! link Conditional Statement
hi! link Constant OcOrange
hi! link Debug OcYellow
hi! link Define OcLilac
hi! link Delimiter Special
hi! link Error OcError
hi! link Exception OcAqua
hi! link Float OcOrange
hi! link Function OcBlue
hi! link Identifier OcAqua
hi! link Include OcLilac
hi! link Keyword Statement
hi! link Label Statement
hi! link Macro PreProc
hi! link Number OcOrange
hi! link Operator OcRed
hi! link PreCondit OcBrown
hi! link PreProc OcYellow
hi! link Repeat Statement
hi! link Special OcAqua
hi! link SpecialChar Special
hi! link Statement OcRed
hi! link StorageClass OcYellow
hi! link String OcGreen
hi! link Structure Type
hi! link Tag OcRed
hi! link Title OcBlueBold
hi! link Type OcYellow
hi! link Typedef OcAqua

" }}}

" ----- Builtin (nvim-lsp) ------------------------------------------------- {{{

" See `:help lsp-highlight` for reference

if has('nvim')

" Highlights for vim.lsp.buf.document_highlight()
hi! link LspReferenceText Visual
hi! link LspReferenceRead Visual
hi! link LspReferenceWrite Visual

" Other LSP highlights link to these by default (except Underline)
hi! link LspDiagnosticsDefaultError OcError
hi! link LspDiagnosticsDefaultWarning OcWarning
hi! link LspDiagnosticsDefaultInformation OcInfo
hi! link LspDiagnosticsDefaultHint OcHint

" Diagnostic messages placed as virtual text
hi! link LspDiagnosticsVirtualTextError OcError
hi! link LspDiagnosticsVirtualTextWarning OcWarning
hi! link LspDiagnosticsVirtualTextInformation OcInfo
hi! link LspDiagnosticsVirtualTextHint OcHint

" Underline of text causing diagnostic message
call s:HL('LspDiagnosticsUnderlineError', s:red, s:none, 'undercurl')
call s:HL('LspDiagnosticsUnderlineWarning', s:yellow, s:none, 'undercurl')
call s:HL('LspDiagnosticsUnderlineInformation', s:blue, s:none, 'undercurl')
call s:HL('LspDiagnosticsUnderlineHint', s:lilac, s:none, 'undercurl')

" Diagnostic messages in floating window
call s:HL('LspDiagnosticsFloatingError', s:fg)
call s:HL('LspDiagnosticsFloatingWarning', s:fg)
call s:HL('LspDiagnosticsFloatingInformation', s:fg)
call s:HL('LspDiagnosticsFloatingHint', s:fg)

" Signs placed in sign column
hi! link LspDiagnosticsSignError OcError
hi! link LspDiagnosticsSignWarning OcWarning
hi! link LspDiagnosticsSignInformation OcInfo
hi! link LspDiagnosticsSignHint OcHint

endif

" }}}

" ========================================================================== }}}



" ==============================================================================
" ***** Plugin Highlights ******************************************************
" ==============================================================================
" {{{

" ----- Plugin (barbar) ---------------------------------------------------- {{{

call s:HL('BufferTabpageFill', s:bg4, s:bg1)
call s:HL('BufferTabpages', s:bg4, s:none, s:bold)

hi! link BufferCurrent TabLineSel
hi! link BufferCurrentMod OcGreenBold
hi! link BufferCurrentSign OcAqua

call s:HL('BufferVisible', s:fg4, s:bg1, s:bold)
call s:HL('BufferVisibleMod', s:green, s:bg1, s:bold)
call s:HL('BufferVisibleSign', s:bg4, s:bg1)

hi! link BufferInactive TabLine
call s:HL('BufferInactiveMod', ['#65876d', 65], s:bg1, s:bold)
hi! link BufferInactiveSign BufferTabpageFill

" }}}

" ----- Plugin (Buftabline) ------------------------------------------------ {{{

hi! link BuftablineActive TabLine

" }}}

" ----- Plugin (coc.vim) --------------------------------------------------- {{{

call s:HL('CocErrorHighlight', s:none, s:none, 'undercurl', s:red)
call s:HL('CocHintHighlight', s:none, s:none, 'undercurl', s:lilac)
call s:HL('CocInfoHighlight', s:none, s:none, 'undercurl', s:blue)
call s:HL('CocWarningHighlight', s:none, s:none, 'undercurl', s:yellow)

" }}}

" ----- Plugin (ale) ------------------------------------------------------- {{{

hi! link ALEErrorSign OcRed
hi! link ALEWarningSign OcYellow
hi! link ALEInfoSign OcBlue

" }}}

" ----- Plugin (fzf) ------------------------------------------------------- {{{

" NOTE: These groups color the statusline, not the prompt!

call s:HL('fzf1', s:fg4, s:bg2)
hi! link fzf2 fzf1
hi! link fzf3 fzf1

" }}}

" ----- Plugin (netrw) ----------------------------------------------------- {{{

hi! link netrwClassify OcAqua
hi! link netrwExe OcYellow
hi! link netrwHidePat netrwList
hi! link netrwLink OcDarkAqua
hi! link netrwList OcLilac
hi! link netrwSymLink OcAqua
hi! link netrwVersion OcGreen

" }}}

" ----- Plugin (nvim-treesitter) ------------------------------------------- {{{

hi! link TSError OcError
hi! link TSField OcFg
hi! link TSNamespace OcAqua
hi! link TSParameter OcFg
hi! link TSPunctBracket OcFg
hi! link TSVariableBuiltin OcRed

" }}}

" ----- Plugin (vim-gitgutter) --------------------------------------------- {{{

hi! link GitGutterAdd OcGreen
hi! link GitGutterChange OcBlue
hi! link GitGutterDelete OcRed
hi! link GitGutterChangeDelete OcOrange

" }}}

" ----- Plugin (vim-signify) ----------------------------------------------- {{{

hi! link SignifyLineAdd DiffAdd
hi! link SignifyLineChange DiffChange
hi! link SignifyLineDelete DiffDelete
hi! link SignifySignAdd OcGreen
hi! link SignifySignChange OcBlue
hi! link SignifySignDelete OcRed

" }}}

" ----- Plugin (vim-startify) ---------------------------------------------- {{{

hi! link StartifyBracket OcFg2
hi! link StartifyFile OcLilacBold
hi! link StartifyFooter Comment
hi! link StartifyHeader OcGreen
hi! link StartifyNumber OcOrange
hi! link StartifyPath OcFg4
hi! link StartifySection OcBlueBold
hi! link StartifySelect OcGreenBold
hi! link StartifySlash OcFg2

" }}}

" ========================================================================== }}}



" ----- Syntax (diff) ------------------------------------------------------ {{{

hi! link diffAdded OcGreen
hi! link diffFile OcLilacBold
hi! link diffIndexLine OcFg2
hi! link diffLine OcBlue
hi! link diffRemoved OcRed
hi! link diffSubname OcAqua

" }}}

" {{{ Terminal
if has('nvim')
  let g:terminal_color_0=s:fg5
  let g:terminal_color_8=s:bg3

  let g:terminal_color_1=s:red
  let g:terminal_color_9=s:red

  let g:terminal_color_2=s:green
  let g:terminal_color_10=s:green

  let g:terminal_color_3=s:yellow
  let g:terminal_color_11=s:yellow

  let g:terminal_color_4=s:blue
  let g:terminal_color_12=s:blue

  let g:terminal_color_5=s:lilac
  let g:terminal_color_13=s:lilac

  let g:terminal_color_6=s:daqua
  let g:terminal_color_14=s:daqua

  let g:terminal_color_7=s:bg5
  let g:terminal_color_15=s:bg5

  let g:terminal_color_background=s:bg3
  let g:terminal_color_foreground=s:fg5
else
  let g:terminal_ansi_colors = [
     \ s:bg3[0],
     \ s:red[0],
     \ s:green[0],
     \ s:yellow[0],
     \ s:blue[0],
     \ s:lilac[0],
     \ s:daqua[0],
     \ s:fg3[0],
     \ s:bg3[0],
     \ s:red[0],
     \ s:green[0],
     \ s:yellow[0],
     \ s:blue[0],
     \ s:lilac[0],
     \ s:daqua[0],
     \ s:fg3[0],
     \]

endif

" }}}

" vim: sw=2 ts=2 sts=2 tw=80 cc=81 ft=vim fdm=marker fmr={{{,}}}
