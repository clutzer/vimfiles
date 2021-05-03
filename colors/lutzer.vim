" vim color file
" vim: set tw=0 sw=2 ts=2
" Maintainer: Christiaan Lutzer <christiaan.lutzer@gmail.com>
" Last Change: 2004 November 18

" This is a modified colour scheme based on Bram's default scheme.  It uses a
" black background, with light grey text.
"
" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
"
hi clear Normal
"set bg&

"
" Remove all existing highlighting and set the defaults.
"
hi clear

"
" Load the syntax highlighting defaults, if it's enabled.
"
if exists("syntax_on")
  syntax reset
endif

let colors_name = "lutzer"

"
" This might be overstepping my boundaries, but I'm going to set the default
" font here.  The first is for UNIX systems, the second is for Win32 systems.
"
"if has("win32")
"  set guifont=Lucida_Console:h10
"else
"  set guifont=-misc-fixed-medium-r-normal-*-*-120-*-*-c-*-koi8-r
"endif

if has("gui_running")
    set background=dark
endif

hi Cursor       guibg=Green     guifg=DarkGreen   gui=none
hi StatusLine   guibg=DarkGreen guifg=Green       gui=none
hi StatusLineNC guibg=#444444   guifg=#A0A0A0     gui=none
hi Visual       guibg=Green     guifg=DarkGreen   gui=none

" Uncomment the following to get italic comments.
"
" For reference, the following does an excellent job presenting the available
" colors to an Xterm:
"
" http://upload.wikimedia.org/wikipedia/en/1/15/Xterm_256color_chart.svg
"
"hi Comment                      guifg=#808080     gui=italic  ctermfg=Magenta cterm=none    term=none
hi Normal       guibg=Black     guifg=Grey        gui=none 
hi Comment                      guifg=#808080     gui=none    ctermfg=243     cterm=none    term=none
hi Include                      guifg=DarkCyan    gui=none    ctermfg=Magenta cterm=none    term=none
hi Number                       guifg=#FF0000     gui=none    ctermfg=Red     cterm=none    term=bold
hi PreProc                      guifg=DarkCyan    gui=none    ctermfg=Brown   cterm=none    term=none
hi String                       guifg=Green       gui=none    ctermfg=28      cterm=none    term=none
hi Statement                    guifg=#4080FF     gui=bold    ctermfg=25      cterm=none    term=bold
hi Type                         guifg=#4080FF     gui=bold    ctermfg=53      cterm=none    term=bold
hi Constant                                                   ctermfg=Red
hi Special                                                    ctermfg=130
hi Identifier                                                 ctermfg=238     cterm=none
hi Underlined                                                 ctermfg=15      ctermbg=130
"hi NonText      guibg=#A0A0A0   guifg=Black       gui=bold
hi NonText                      guifg=Orange      gui=none    ctermfg=Yellow  cterm=none    term=none
hi SpecialKey                   guifg=Orange      gui=none    ctermfg=Yellow  cterm=none    term=none

