" utb-green colorscheme
" Author: utubo
" GitHub: https://github.com/utubo/vim-utb
" Notes:
" Thx: This is based on https://github.com/ggalindezb/vim_colorscheme_template
"
highlight clear
if exists('syntax_on')
	syntax reset
endif
let s:colors_name = expand('<sfile>:t:r')
let g:colors_name = s:colors_name
let s:background = &background

" COLORS
"   <type><opacity>
" type:
"   n: normal
"   b: positiv1(blue)
"   g: positiv2(green)
"   y: warn(yellow)
"   r: error(red)
" opacity:
"   0: 0% default bg (only n0)
"   1: 10% bg
"   2: 50% middle fg
"   3: 100% default fg
"   4: Highlight (eg. b4=cursor,g4=search)
"   9: Highlight on &background == 'light'
if has('gui_running')
	let s:term = 'gui'
	let s:n0 = '#262e29'
	let s:n1 = '#505553'
	let s:n2 = '#88aaa9'
	let s:n3 = '#cbddd3'
	let s:n4 = '#f3fff6'
	let s:b1 = '#303840'
	let s:b2 = '#66aabb'
	let s:b3 = '#77c4d4'
	let s:b3 = '#99ddee'
	let s:b4 = '#10caff'
	let s:b9 = s:b4
	let s:g1 = '#118855'
	let s:g2 = '#55cc99'
	let s:g3 = '#88ffbb'
	let s:g4 = '#22dd77'
	let s:g9 = s:g4
	let s:y1 = '#332211'
	let s:y2 = '#997755' " not used
	let s:y3 = '#ffee99'
	let s:y4 = '#ffcc00'
	let s:y9 = '#cc60ee' " purple
	let s:r1 = '#331122'
	let s:r2 = '#992233' " not used
	let s:r3 = '#ee6677'
	let s:r4 = '#ff3344'
	let s:r9 = s:r4
else
	set t_Co=256
	let s:term = 'cterm'
	let s:n0 = '236'
	let s:n1 = '240'
	let s:n2 = '109'
	let s:n3 = '151'
	let s:n4 = '194'
	let s:b1 = '239'
	let s:b2 = '74'
	let s:b3 = '123'
	let s:b4 = '39'
	let s:b9 = s:b4
	let s:g1 = '65'
	let s:g2 = '72'
	let s:g3 = '48'
	let s:g4 = '78'
	let s:g9 = s:g4
	let s:y1 = '101'
	let s:y2 = '220' " not used
	let s:y3 = '227'
	let s:y4 = '11'
	let s:y9 = '93' " purple
	let s:r1 = '52'
	let s:r2 = '124' " not used
	let s:r3 = '203'
	let s:r4 = '204'
	let s:r9 = s:r4
endif

if &background == 'light'
	let [s:n0, s:n1, s:n3, s:n4] = [s:n4, s:n3, s:n1, s:n0]
	let [s:b1, s:b3, s:b4] = [s:b3, s:b1, s:b9]
	let [s:g1, s:g3, s:g4] = [s:g3, s:g1, s:g9]
	let [s:y1, s:y3, s:y4] = [s:y3, s:y1, s:y9]
	let [s:r1, s:r3, s:r4] = [s:r3, s:r1, s:r9]
endif

let s:fg     = s:term.'fg='
let s:bg     = s:term.'bg='
let s:style  = s:term.'='
let s:none   = s:style.'NONE'
let s:bold   = s:style.'bold'
let s:italic = s:style.'italic'

" --------
" - Base -
" --------
exe 'hi Normal'        s:fg s:n3 s:bg s:n0
exe 'hi Cursor'        s:fg s:n4 s:bg s:b4
exe 'hi CursorIM'      s:fg s:n4 s:bg s:y4
exe 'hi CursorLine'    s:bg s:n1
exe 'hi LineNr'        s:fg s:n2 s:bg s:n1
exe 'hi CursorLineNR'  s:fg s:n4 s:bg s:n2
exe 'hi CursorLine'    s:bg s:n1

" -----------------
" - Number column -
" -----------------
exe 'hi CursorColumn'  s:bg s:n1
exe 'hi FoldColumn'    s:bg s:n1
exe 'hi SignColumn'    s:fg s:g4 s:bg s:n1
exe 'hi Folded'        s:fg s:n2 s:bg s:n0

" -------------------------
" - Window/Tab delimiters -
" -------------------------
exe 'hi VertSplit'     s:bg s:n1
exe 'hi ColorColumn'   s:fg s:n2 s:bg s:n1
exe 'hi TabLine'       s:fg s:n2 s:bg s:n1
exe 'hi TabLineFill'   s:bg s:n1
exe 'hi TabLineSel'    s:fg s:g3 s:bg s:n0 s:bold

" -------------------------------
" - File Navigation / Searching -
" -------------------------------
exe 'hi Directory'     s:fg s:g4
exe 'hi Search'        s:fg s:n0 s:bg s:g4 s:bold
hi! link IncSearch Cursor

" -----------------
" - Prompt/Status -
" -----------------
exe 'hi StatusLine'    s:fg s:n2 s:bg s:n1
exe 'hi StatusLineNC'  s:fg s:n3 s:bg s:n2
hi! link WildMenu Visual
exe 'hi Question'      s:fg s:y4 s:bg s:n0 s:none
exe 'hi Title'         s:fg s:b3 s:bg s:n0 s:bold
exe 'hi ModeMsg'       s:fg s:n3 s:bg s:n0 s:none
exe 'hi MoreMsg'       s:fg s:n2 s:bg s:n0 s:none

" --------------
" - Visual aid -
" --------------
exe 'hi MatchParen'    s:fg s:b4 s:bg s:n0
exe 'hi Visual'        s:fg s:n4 s:bg s:b2 s:none
exe 'hi VisualNOS'     s:fg s:n2 s:bg s:b3 s:none
exe 'hi NonText'       s:fg s:n1 s:none

exe 'hi Todo'          s:fg s:b4 s:bg 'NONE' s:bold
exe 'hi Underlined'    s:fg s:b4
exe 'hi Error'         s:fg s:r4 s:bg 'NONE' s:bold
exe 'hi ErrorMsg'      s:fg s:r3 s:bg 'NONE' s:none
exe 'hi WarningMsg'    s:fg s:y3
hi! link Ignore NonText
hi! link SpecialKey NonText

" --------------------------------
" Variable types
" --------------------------------
exe 'hi Function'      s:fg s:b2
exe 'hi Identifier '   s:fg s:n3
exe 'hi Constant'      s:fg s:b2
exe "hi String"        s:fg s:b2 s:bg s:b1
exe 'hi Character'     s:fg s:b2
exe 'hi Number'        s:fg s:b2
hi! link Boolean Number
hi! link Float Number

" --------------------------------
" Language constructs
" --------------------------------
exe 'hi Statement'     s:fg s:b3
exe 'hi Conditional'   s:fg s:b3
exe 'hi Repeat'        s:fg s:b3
exe 'hi Label'         s:fg s:b3 s:bold
exe 'hi Keyword'       s:fg s:n2
exe 'hi Exception'     s:fg s:y3
exe 'hi Comment'       s:fg s:g2
exe 'hi SpecialComment' s:fg s:g2 s:italic
exe 'hi SpecialChar'   s:fg s:b3
exe 'hi Tag'           s:fg s:g3
exe 'hi Delimiter'     s:fg s:y4
exe 'hi Debug'         s:fg s:n2
hi! link Operator Normal
hi! link Special Statement

" ----------
" - C like -
" ----------
exe 'hi PreProc' s:fg s:b3
hi! link Include KeyWord
hi! link Define KeyWord
hi! link Macro KeyWord
hi! link PreCondit KeyWord

hi! link Type KeyWord
hi! link StorageClass Type
hi! link Structure Type
hi! link Typedef Type

" --------------------------------
" Diff
" --------------------------------
exe 'hi DiffAdd'       s:fg s:b1 s:bg s:g3
exe 'hi DiffChange'    s:fg s:y1 s:bg s:y3
exe 'hi DiffDelete'    s:fg s:r3 s:bg s:r3
exe 'hi DiffText'      s:fg s:g1 s:bg s:g3 s:none

" --------------------------------
" Completion menu
" --------------------------------
exe 'hi Pmenu'         s:fg s:n1 s:bg s:b2
hi! link PmenuSel Cursor
exe 'hi PmenuSbar'     s:bg s:b1
exe 'hi PmenuThumb'    s:bg s:b3

" --------------------------------
" Spelling
" --------------------------------
exe 'hi SpellBad'      s:fg s:r3 s:bg s:r1 s:style 'undercurl'
exe 'hi SpellCap'      s:fg s:y3 s:bg s:n0 s:style 'undercurl'
exe 'hi SpellLocal'    s:fg s:g3 s:bg s:n0
exe 'hi SpellRare'     s:fg s:b3 s:bg s:n0

" you can do it

"-------------------------------------------------
" Specific settings
"-------------------------------------------------
exe 'hi javaScriptEmbed' s:fg s:g3 s:bg s:b1

exe 'hi EasyMotionShadeDefault' s:fg s:n2 s:bg s:n0
exe 'hi EasyMotionTarget' s:fg s:b4 s:bg s:n0
exe 'hi EasyMotionTarget2First' s:fg s:g4 s:bg s:n0
hi! link EasyMotionTarget2Second EasyMotionTarget2First

exe 'hi ALEErrorSign' s:fg s:r4 s:bg s:n1
exe 'hi ALEWarningSign' s:fg s:y4 s:bg s:n1

function s:CustomSyntax()
	if g:colors_name != s:colors_name
		exe 'augroup CustomSyntax_' . s:colors_name . '|au!|augroup END'
		return
	endif
	exe 'hi GitGutterAdd' s:fg s:g3 s:bg s:n1
	exe 'hi GitGutterChange' s:fg s:y3 s:bg s:n1
	exe 'hi GitGutterDelete' s:fg s:r3 s:bg s:n1
	hi! link diffAdded DiffAdd
	hi! link diffChanged DiffChange
	hi! link diffRemoved DiffDelete
endfunction

exe 'augroup CustomSyntax_' . s:colors_name . '|au!|au ColorScheme,Syntax * call <SID>CustomSyntax()|augroup END'
call s:CustomSyntax()

exe 'set background='.s:background

