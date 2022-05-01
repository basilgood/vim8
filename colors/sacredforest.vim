" VIM COLOR SCHEME
" Maintainer:   Karolis Koncevicius
" Inspirations: nova, zenburn

hi clear

if exists('syntax_on')
  syntax reset
endif

let g:colors_name='sacredforest'

set background=dark

hi Normal           ctermbg=0    ctermfg=7     cterm=NONE      guibg=#132132 guifg=#c0c99b   gui=NONE

hi Comment          ctermbg=NONE ctermfg=14    cterm=NONE      guibg=NONE    guifg=#575921   gui=NONE
hi Special          ctermbg=NONE ctermfg=15    cterm=NONE      guibg=NONE    guifg=#5ca564   gui=NONE
hi Statement        ctermbg=NONE ctermfg=15    cterm=NONE      guibg=NONE    guifg=#5ca564   gui=NONE
hi Type             ctermbg=NONE ctermfg=15    cterm=NONE      guibg=NONE    guifg=#5ca564   gui=NONE
hi PreProc          ctermbg=NONE ctermfg=15    cterm=NONE      guibg=NONE    guifg=#5ca564   gui=NONE
hi Function         ctermbg=NONE ctermfg=15    cterm=NONE      guibg=NONE    guifg=#bf6794   gui=NONE

hi Identifier       ctermbg=NONE ctermfg=10    cterm=NONE      guibg=NONE    guifg=#79a55c   gui=NONE
hi Constant         ctermbg=NONE ctermfg=10    cterm=NONE      guibg=NONE    guifg=#79a55c   gui=NONE
hi Boolean          ctermbg=NONE ctermfg=10    cterm=NONE      guibg=NONE    guifg=#79a55c   gui=NONE
hi String           ctermbg=NONE ctermfg=10    cterm=NONE      guibg=NONE    guifg=#79a55c   gui=NONE

hi Title            ctermbg=NONE ctermfg=6     cterm=BOLD      guibg=NONE    guifg=#c5d4dd   gui=BOLD
hi SpecialComment   ctermbg=NONE ctermfg=6     cterm=NONE      guibg=NONE    guifg=#c5d4dd   gui=NONE

hi LineNr           ctermbg=NONE ctermfg=14    cterm=NONE      guibg=NONE    guifg=#213a59   gui=NONE
hi CursorLineNr     ctermbg=NONE ctermfg=11    cterm=NONE      guibg=NONE    guifg=#ddd668   gui=NONE
hi MatchParen       ctermbg=NONE ctermfg=12    cterm=NONE      guibg=NONE    guifg=#7fc1ca   gui=NONE
hi Conceal          ctermbg=NONE ctermfg=14    cterm=NONE      guibg=NONE    guifg=#182a3f   gui=NONE
hi SpecialKey       ctermbg=NONE ctermfg=14    cterm=NONE      guibg=NONE    guifg=#182a3f   gui=NONE
hi ColorColumn      ctermbg=14   ctermfg=NONE  cterm=NONE      guibg=#182a3f guifg=NONE      gui=NONE
hi SignColumn       ctermbg=14   ctermfg=NONE  cterm=NONE      guibg=#182a3f guifg=NONE      gui=NONE
hi Folded           ctermbg=NONE ctermfg=12    cterm=NONE      guibg=NONE    guifg=#7fc1ca   gui=NONE
hi FoldColumn       ctermbg=NONE ctermfg=12    cterm=NONE      guibg=NONE    guifg=#7fc1ca   gui=NONE

hi Directory        ctermbg=NONE ctermfg=10    cterm=NONE      guibg=NONE    guifg=#79a55c   gui=NONE
hi Underlined       ctermbg=NONE ctermfg=NONE  cterm=UNDERLINE guibg=NONE    guifg=NONE      gui=UNDERLINE

hi Visual           ctermbg=12   ctermfg=0     cterm=NONE      guibg=#1b2d42 guifg=NONE      gui=NONE
hi VisualNOS        ctermbg=NONE ctermfg=NONE  cterm=UNDERLINE guibg=NONE    guifg=NONE      gui=UNDERLINE
hi IncSearch        ctermbg=3    ctermfg=0     cterm=NONE      guibg=#ffbf00 guifg=#132132   gui=NONE
hi Search           ctermfg=0    ctermbg=11    cterm=NONE      guibg=#143459 guifg=NONE      gui=NONE

hi StatusLine       ctermbg=14   ctermfg=7     cterm=NONE      guibg=#182a3f guifg=#c0c99b   gui=NONE
hi StatusLineNC     ctermbg=14   ctermfg=7     cterm=NONE      guibg=#182a3f guifg=#575921   gui=NONE
hi TabLine          ctermbg=14   ctermfg=7     cterm=NONE      guibg=#182a3f guifg=#575921   gui=NONE
hi TabLineSel       ctermbg=14   ctermfg=7     cterm=NONE      guibg=#182a3f guifg=#c0c99b   gui=NONE
hi TabLineFill      ctermbg=14   ctermfg=7     cterm=NONE      guibg=#182a3f guifg=#c0c99b   gui=NONE
hi VertSplit        ctermbg=NONE ctermfg=14    cterm=NONE      guibg=NONE    guifg=#182a3f   gui=NONE
hi WildMenu         ctermbg=7    ctermfg=14    cterm=NONE      guibg=#c0c99b guifg=#182a3f   gui=NONE
hi ModeMsg          ctermbg=NONE ctermfg=12    cterm=NONE      guibg=NONE    guifg=#7fc1ca   gui=NONE

hi DiffAdd          ctermbg=2    ctermfg=0     cterm=NONE      guibg=#132132 guifg=#8eaf6b   gui=NONE
hi DiffDelete       ctermbg=1    ctermfg=0     cterm=NONE      guibg=#132132 guifg=#db6c6c   gui=NONE
hi DiffChange       ctermbg=0    ctermfg=3     cterm=NONE      guibg=#132132 guifg=#ffbf00   gui=UNDERLINE
hi DiffText         ctermbg=3    ctermfg=0     cterm=NONE      guibg=#ffbf00 guifg=#132132   gui=NONE
hi diffAdded        ctermbg=NONE ctermfg=143   cterm=NONE      guibg=NONE    guifg=#A3B55E   gui=NONE
hi diffRemoved      ctermbg=NONE ctermfg=131   cterm=NONE      guibg=NONE    guifg=#B55E5E   gui=NONE
hi diffLine         ctermbg=12   ctermfg=0     cterm=NONE      guibg=#1b2d42 guifg=NONE      gui=NONE
hi diffSubname      ctermbg=12   ctermfg=0     cterm=NONE      guibg=NONE    guifg=#575921   gui=NONE

hi Pmenu            ctermbg=14   ctermfg=7     cterm=NONE      guibg=#182a3f guifg=#c0c99b   gui=NONE
hi PmenuSel         ctermbg=14   ctermfg=7     cterm=REVERSE   guibg=#182a3f guifg=#c0c99b   gui=REVERSE
hi PmenuSbar        ctermbg=14   ctermfg=NONE  cterm=NONE      guibg=#182a3f guifg=NONE      gui=NONE
hi PmenuThumb       ctermbg=7    ctermfg=NONE  cterm=NONE      guibg=#c0c99b guifg=NONE      gui=NONE

hi SpellBad         ctermbg=NONE ctermfg=NONE  cterm=UNDERCURL guibg=NONE    guifg=NONE      gui=UNDERCURL
hi SpellCap         ctermbg=NONE ctermfg=NONE  cterm=UNDERCURL guibg=NONE    guifg=NONE      gui=UNDERCURL
hi SpellLocal       ctermbg=NONE ctermfg=NONE  cterm=UNDERCURL guibg=NONE    guifg=NONE      gui=UNDERCURL
hi SpellRare        ctermbg=NONE ctermfg=NONE  cterm=UNDERCURL guibg=NONE    guifg=NONE      gui=UNDERCURL

hi ErrorMsg         ctermbg=1    ctermfg=14    cterm=NONE      guibg=#db6c6c guifg=#182a3f   gui=NONE
hi WarningMsg       ctermbg=NONE ctermfg=1     cterm=NONE      guibg=NONE    guifg=#db6c6c   gui=NONE
hi MoreMsg          ctermbg=NONE ctermfg=12    cterm=NONE      guibg=NONE    guifg=#7fc1ca   gui=NONE
hi Question         ctermbg=NONE ctermfg=12    cterm=NONE      guibg=NONE    guifg=#7fc1ca   gui=NONE

hi Error            ctermbg=NONE ctermfg=1     cterm=REVERSE   guibg=NONE    guifg=#db6c6c   gui=REVERSE
hi Ignore           ctermbg=NONE ctermfg=NONE  cterm=NONE      guibg=NONE    guifg=NONE      gui=NONE
hi Todo             ctermbg=7    ctermfg=14    cterm=NONE      guibg=#c0c99b guifg=#182a3f   gui=NONE

hi NonText          ctermbg=NONE ctermfg=14    cterm=NONE      guibg=NONE    guifg=#182a3f   gui=NONE

hi Cursor           ctermbg=7    ctermfg=0     cterm=NONE      guibg=#c0c99b guifg=#132132   gui=NONE
hi CursorColumn     ctermbg=8    ctermfg=NONE  cterm=NONE      guibg=#182738 guifg=NONE      gui=NONE
hi CursorLine       ctermbg=8    ctermfg=NONE  cterm=NONE      guibg=#182738 guifg=NONE      gui=NONE

hi helpleadblank    ctermbg=NONE ctermfg=NONE  cterm=NONE      guibg=NONE    guifg=NONE      gui=NONE
hi helpnormal       ctermbg=NONE ctermfg=NONE  cterm=NONE      guibg=NONE    guifg=NONE      gui=NONE


hi link Number             Constant
hi link Character          Constant

hi link Conditional        Statement
hi link Debug              Special
hi link Define             PreProc
hi link Delimiter          Special
hi link Exception          Statement
hi link Float              Number
hi link HelpCommand        Statement
hi link HelpExample        Statement
hi link Include            PreProc
hi link Keyword            Statement
hi link Label              Statement
hi link Macro              PreProc
hi link Operator           Statement
hi link PreCondit          PreProc
hi link Repeat             Statement
hi link SpecialChar        Special
hi link SpecialComment     Special
hi link StorageClass       Type
hi link Structure          Type
hi link Tag                Special
hi link Typedef            Type

hi link htmlEndTag         htmlTagName
hi link htmlLink           Function
hi link htmlSpecialTagName htmlTagName
hi link htmlTag            htmlTagName
hi link xmlTag             Statement
hi link xmlTagName         Statement
hi link xmlEndTag          Statement

hi link markdownItalic     Preproc

hi link diffBDiffer        WarningMsg
hi link diffCommon         WarningMsg
hi link diffDiffer         WarningMsg
hi link diffIdentical      WarningMsg
hi link diffIsA            WarningMsg
hi link diffNoEOL          WarningMsg
hi link diffOnly           WarningMsg
hi link diffRemoved        WarningMsg
hi link diffAdded          String

hi link vimHiAttrib        Constant
hi link vimParenSep        Normal
hi link vimVar             Normal
hi link vimFuncVar         Normal
hi link vimMapMod          Identifier
hi link vimMapModKey       Identifier
hi link vimNotation        Identifier
hi link vimBracket         Identifier

hi link QuickFixLine       Visual

let g:terminal_ansi_colors = [
      \'#3B4252', '#BF616A', '#A3BE8C', '#EBCB8B',
      \'#81A1C1', '#B48EAD', '#88C0D0', '#E5E9F0',
      \'#4C566A', '#BF616A', '#A3BE8C', '#EBCB8B',
      \'#81A1C1', '#B48EAD', '#8FBCBB', '#ECEFF4'
      \]
