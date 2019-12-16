hi clear
if exists('syntax_on')
  syntax reset
endif

runtime colors/desert.vim

let g:colors_name = 'verysimple'

hi Comment          ctermbg=NONE        ctermfg=242         cterm=italic
hi Conceal          ctermbg=NONE        ctermfg=250         cterm=NONE
hi Constant         ctermbg=NONE        ctermfg=175         cterm=NONE
hi Function         ctermbg=NONE        ctermfg=229         cterm=NONE
hi Identifier       ctermbg=NONE        ctermfg=67          cterm=NONE
hi PreProc          ctermbg=NONE        ctermfg=66          cterm=NONE
hi Special          ctermbg=NONE        ctermfg=65          cterm=NONE
hi Statement        ctermbg=NONE        ctermfg=12          cterm=NONE
hi String           ctermbg=NONE        ctermfg=109         cterm=NONE
hi Todo             ctermbg=234         ctermfg=150         cterm=reverse
hi Type             ctermbg=NONE        ctermfg=103         cterm=NONE
hi Structure        ctermfg=110

hi MatchParen ctermbg=None ctermfg=199 cterm=bold,underline
hi LineNr           ctermbg=NONE        ctermfg=239    cterm=NONE
hi NonText          ctermbg=NONE        ctermfg=239    cterm=NONE
hi SpecialKey       ctermbg=NONE        ctermfg=239    cterm=NONE

hi ColorColumn cterm=NONE ctermbg=235
hi CursorColumn cterm=NONE ctermbg=235
hi CursorLine ctermbg=235 cterm=NONE
hi CursorLineNr ctermbg=NONE ctermfg=253

hi DiffAdd ctermbg=22 cterm=bold
hi DiffChange ctermbg=22 cterm=bold
hi DiffText ctermbg=33 ctermfg=234
hi DiffDelete ctermbg=52

" Git diff in commit message editing
hi diffAdded ctermfg=2
hi diffRemoved ctermfg=1
hi diffFile ctermfg=3
hi diffLine ctermfg=6
hi diffSubname ctermfg=5

" Statusline/tabline
hi StatusLine cterm=reverse ctermbg=234 ctermfg=245
hi StatusLineTerm cterm=reverse ctermbg=234 ctermfg=245
hi StatusLineNC cterm=reverse ctermbg=238 ctermfg=233
hi StatusLineTermNC cterm=reverse ctermbg=238 ctermfg=233
hi TabLine cterm=NONE ctermbg=233 ctermfg=238
hi TabLineFill cterm=reverse ctermbg=238 ctermfg=233
hi TabLineSel cterm=NONE ctermbg=234 ctermfg=252

" pmenu
hi Pmenu ctermbg=236 ctermfg=251 guibg=#3d425b guifg=#c6c8d1
hi PmenuSbar ctermbg=236 guibg=#3d425b
hi PmenuSel ctermbg=240 ctermfg=255 guibg=#5b6389 guifg=#eff0f4
hi PmenuThumb ctermbg=251 guibg=#c6c8d1

hi VertSplit cterm=NONE ctermbg=233 ctermfg=233
hi Visual ctermbg=235 ctermfg=110 cterm=reverse
hi VisualNOS ctermbg=NONE ctermfg=NONE cterm=underline
hi WildMenu ctermbg=255 ctermfg=234

hi IncSearch ctermfg=235 ctermbg=15 gui=NONE cterm=NONE
hi Search ctermbg=blue gui=Bold cterm=Bold

hi SpellBad ctermbg=95 ctermfg=252
hi SpellCap ctermbg=24 ctermfg=252
hi SpellLocal ctermbg=23 ctermfg=252
hi SpellRare ctermbg=97 ctermfg=252
