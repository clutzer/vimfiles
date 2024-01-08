" An example for a vimrc file.
"
" Maintainer:   Bram Moolenaar <Bram@vim.org>
" Last change:  2002 Sep 19
"               2005 Feb 10 <clutzer@schange.com>
"               2006 Sep 30 クリスチャン <christiaan.lutzer@gmail.com>
"
" To use it, copy it to
"   for Unix and OS/2:  ~/.vimrc
"   for Amiga:  s:.vimrc
"   for MS-DOS and Win32:  $VIM\_vimrc
"   for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set modeline          " enable modelines!
set noswapfile
"set backup            " create backup files!!!!!!
set history=50        " keep 50 lines of command line history
set ruler             " show the cursor position all the time
set showcmd           " display incomplete commands
set incsearch         " do incremental searching
set tabstop=4         " tabstops occur every 4 spaces
set shiftwidth=4      " we indent by 4 spaces
set novisualbell      " no annoying visual bell please
set mousehide         " hide the mouse when we type
set expandtab         " expand tab characters into spaces
set nowrap            " don't wrap text, use horizontal scrollbar instead
set encoding=utf-8
set fileencoding=utf-8
set statusline=%<%t%h%m%r[fo=%{&fo}]%=%b\ 0x%B\ \ %l,%c%V\ %P
set laststatus=2
set showmatch

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

function DebugHighlighting()
    let hiID = synID( line("."), col("."), 1 )
    let hiName = synIDattr(hiID, "name")
    echo "Text under the cursor highlights as a <" . hiName . ">"
    " Traverse any link-tos...
    let hiTransID = synIDtrans(hiID)
    while hiID != hiTransID
        "echo "DEBUG(loop vars): hiID=" . hiID . "; hiTransID=" . hiTransID
        let loName = synIDattr(hiTransID, "name")
        echo "<" . hiName . "> links to <" . loName . ">"
        " Update loop vars
        let hiID = hiTransID
        let hiTransID = synIDtrans(hiID)
        " Update hiName so it's always "current"
        let hiName = synIDattr(hiID, "name")
    endwhile
    echo "<" . hiName . "> is defined as:"
    execute "hi " . hiName
endfunction

map <F2> :call DebugHighlighting()<CR>
map <F4> :e ++enc=cp1252<CR>

" Format XML with xmllint:
map @@x V!xmllint --format -<CR>
" Format JSON with python json.tools:
map @@j V!python3 -m json.tool<CR>
map @@js :set filetype=javascript<CR>
map @@h :set filetype=html<CR>
map @@p :set filetype=php<CR>

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  colorscheme lutzer
  "colorscheme desert
  "colorscheme simplewhite
  syntax on
  set hlsearch
  "set guifont=MS_Gothic:h9:cANSI
  "set guifont=Lucida_Console:h9:cANSI
  set guifont=Consolas:h11
endif

if has("gui_running")
  " :help guioptions
  set guioptions=agimrLtTb
endif

if has("gui_macvim")
  " 2024/01/08 - let MacVim use the system font
  set guifont=-monospace-:h12
endif
  
" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " For Perl files, limit the width to 78 characters, and use 2 space
  " indenting.
  autocmd BufRead *.pm,*.pl,*.rb,*.erb,*.html set tw=78 ts=2 sw=2

  " For Roku Brightscript files, highlight them as if they were a known,
  " recognized type.
  autocmd BufRead *.brs set ft=vb comments=:' ts=4 sw=4 noet

  "autocmd BufEnter * highlight OverLength ctermbg=yellow guibg=#505050 guifg=white
  "autocmd BufEnter * match OverLength /\%81v.*/

  autocmd BufRead *.md set tw=80 ts=4 sw=4 et wrap

  " Linode VBIN enhancement.
  au BufRead,BufNewFile host.lib set filetype=perl

  augroup END

else

  set autoindent        " always set autoindenting on

endif " has("autocmd")
