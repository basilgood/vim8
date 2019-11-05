" after apprentice layout and onedark colours

hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'theonlyone'

set background=dark

hi Normal           guifg=#abb2bf guibg=#282c34 gui=NONE cterm=NONE
hi Terminal         guifg=#ebdbb2 guibg=#1d2021 gui=NONE cterm=NONE
hi LineNr           guifg=#4b5263 guibg=NONE gui=NONE term=underline ctermfg=59
hi FoldColumn       guifg=#5c5c5c guibg=#14171c gui=NONE
hi Folded           guifg=#5c5c5c guibg=#14171c gui=NONE
hi MatchParen       guifg=#e91e63 guibg=NONE    gui=underline ctermfg=197 ctermbg=NONE cterm=underline
hi SignColumn       guifg=NONE guibg=#282c34 gui=NONE cterm=NONE term=NONE ctermbg=NONE

hi Comment          guifg=#5c6370 guibg=NONE    gui=italic cterm=italic
hi Conceal          guifg=#ebdbb2 guibg=NONE    gui=NONE cterm=NONE
hi Constant         guifg=#98C379 guibg=NONE    gui=NONE cterm=NONE
hi Number           guifg=#d19a66 guibg=NONE    gui=NONE cterm=NONE
hi Error            guifg=#E06C75 guibg=#282c34 gui=reverse
hi Identifier       guifg=#E06C75 guibg=NONE    gui=NONE
hi Ignore           guifg=NONE    guibg=NONE    gui=NONE cterm=NONE
hi PreProc          guifg=#E5C07B guibg=NONE    gui=NONE term=underline
hi Special          guifg=#61afef guibg=NONE    gui=NONE cterm=NONE
hi Statement        guifg=#C678DD guibg=NONE    gui=NONE cterm=NONE
hi String           guifg=#98C379 guibg=NONE    gui=NONE cterm=NONE
hi Todo             guifg=NONE    guibg=NONE    gui=reverse cterm=reverse
hi Type             guifg=#E5C07B guibg=NONE    gui=NONE cterm=NONE
hi Underlined       guifg=NONE    guibg=NONE    gui=underline ctermbg=NONE ctermfg=NONE cterm=underline
hi Label            guifg=#E06C75 guibg=NONE    gui=NONE cterm=NONE
hi Operator         guifg=#528bff guibg=NONE    gui=NONE cterm=NONE

hi NonText          guifg=#3b4048 guibg=NONE    gui=NONE cterm=NONE

hi Pmenu            guibg=#444444 guifg=#bcbcbc gui=NONE
hi PmenuSbar        guibg=#585858 guifg=NONE    gui=NONE
hi PmenuSel         guibg=#5f8787 guifg=#262626 gui=NONE
hi PmenuThumb       guibg=#5f8787 guifg=#5f8787 gui=NONE

hi ErrorMsg         guifg=#1d2021 guibg=#af5f5f gui=NONE cterm=NONE
hi ModeMsg          guifg=#1d2021 guibg=#87af87 gui=NONE cterm=NONE
hi MoreMsg          guifg=#5f8787 guibg=NONE    gui=NONE cterm=NONE
hi Question         guifg=#66ff33 guibg=NONE    gui=NONE cterm=NONE
hi WarningMsg       guifg=#af5f5f guibg=NONE    gui=NONE cterm=NONE
hi Exception        guifg=#A6E22E               gui=bold

hi TabLine          guifg=#999999 guibg=#444444 gui=NONE cterm=NONE
hi TabLineFill      guifg=NONE    guibg=#444444 gui=NONE cterm=NONE
hi TabLineSel       guifg=#c9d05c guibg=NONE    gui=NONE cterm=NONE

hi Cursor           guifg=bg guibg=#528bff gui=NONE cterm=NONE
hi CursorLine       guifg=NONE    guibg=#2c323c gui=NONE cterm=NONE
hi CursorLineNr     guifg=#abb2bf guibg=#2c323c    gui=NONE cterm=NONE
hi CursorColumn     guifg=NONE    guibg=#2c323c gui=NONE cterm=NONE

hi helpLeadBlank    guibg=NONE    guifg=NONE    gui=NONE
hi helpNormal       guibg=NONE    guifg=NONE    gui=NONE

hi StatusLine       guifg=#14171c guibg=#777777 gui=NONE cterm=NONE
hi StatusLineNC     guifg=#999999 guibg=#444444 gui=NONE cterm=NONE

hi StatusLineTerm   guibg=#87875f guifg=#262626 gui=NONE
hi StatusLineTermNC guibg=#444444 guifg=#87875f gui=NONE

hi Visual           guifg=NONE    guibg=#3b4351 gui=NONE cterm=NONE
hi VisualNOS        guifg=NONE    guibg=#3b4351 gui=NONE cterm=NONE

hi WildMenu         guifg=#282828 guibg=#c9d05c gui=NONE cterm=NONE
hi VertSplit        guifg=#333333 guibg=#333333 gui=NONE cterm=NONE

hi Function         guifg=#61AFEF guibg=NONE    gui=NONE cterm=NONE
hi SpecialKey       guifg=#3b4048 guibg=NONE    gui=NONE cterm=NONE
hi Title            guifg=#98c379 guibg=NONE    gui=NONE cterm=NONE

hi diffAdded             guifg=#a9b665 gui=NONE ctermfg=46  cterm=NONE
hi diffRemoved           guifg=#ea6962 gui=NONE ctermfg=203 cterm=NONE
hi link diffSubname Normal
hi DiffAdd               guifg=#8ec07c guibg=#1d2021 cterm=NONE
hi link DiffChange NONE
hi clear DiffChange
hi DiffDelete            guifg=#f93d3d guibg=#1d2021 cterm=NONE
hi DiffText              guifg=#FFB86C guibg=#14141a gui=NONE cterm=NONE

hi IncSearch guifg=#282828 ctermfg=235 guibg=#ffffff ctermbg=15 gui=NONE cterm=NONE
hi Search guifg=fg guibg=NONE ctermbg=NONE gui=underline,Bold cterm=underline,Bold

hi Directory        guifg=#61AFEF guibg=NONE    gui=NONE cterm=NONE

hi debugPC          guibg=#5f87af
hi debugBreakpoint  guibg=#af5f5f

hi SpellBad         guibg=NONE    guifg=#af5f5f gui=undercurl guisp=NONE
hi SpellCap         guibg=NONE    guifg=#5fafaf gui=undercurl guisp=NONE
hi SpellLocal       guibg=NONE    guifg=#5f875f gui=undercurl guisp=NONE
hi SpellRare        guibg=NONE    guifg=#ff8700 gui=undercurl guisp=NONE

hi ColorColumn      guibg=#14171c guifg=NONE    gui=NONE

hi ALEWarningSign   guifg=#fabd2f guibg=#14171c gui=NONE cterm=NONE
hi ALEErrorSign     guifg=#f93d3d guibg=#14171c gui=NONE cterm=NONE

hi ParenMatch term=reverse ctermbg=11 guifg=#85EB6A guibg=#135B00 gui=NONE cterm=NONE

hi vimUserFunc guifg=#56b6c2
hi vimFuncName guifg=#C678DD
hi vimHighlight guifg=#61AFEF
hi link vimFunction vimUserFunc
hi jsArrowFunction guifg=#C678DD
hi jsBraces guifg=#828997
hi jsClassBraces guifg=#828997
hi jsClassKeywords guifg=#C678DD
hi jsDocParam guifg=#61AFEF
hi jsDocTags guifg=#C678DD
hi jsFuncBraces guifg=#828997
hi jsFuncCall guifg=#61AFEF
hi jsFuncParens guifg=#828997
hi jsFunction guifg=#C678DD
hi jsGlobalObjects guifg=#E5C07B
hi jsModuleWords guifg=#C678DD
hi jsModules guifg=#C678DD
hi jsNoise guifg=#828997
hi jsNull guifg=#d19a66
hi jsOperator guifg=#C678DD
hi jsParens guifg=#828997
hi jsStorageClass guifg=#C678DD
hi jsTemplateBraces guifg=#be5046
hi jsTemplateVar guifg=#98C379
hi jsThis guifg=#E06C75
hi jsUndefined guifg=#d19a66
hi jsObjectValue guifg=#61AFEF
hi jsObjectKey guifg=#56b6c2
hi jsReturn guifg=#C678DD
hi htmlArg guifg=#d19a66
hi htmlTagName guifg=#E06C75
hi htmlTagN guifg=#E06C75
hi htmlSpecialTagName guifg=#E06C75
hi htmlTag guifg=#828997
hi htmlEndTag guifg=#828997
hi link yamlBool SpellRare
hi link nixAttributeDefinition Type
hi link nixAttribute Type
hi link nixPath String
hi link nixBoolean SpellRare
hi link nixArgumentDefinition Normal
hi link nixURI String
hi link nixSimpleFunctionArgument Normal
