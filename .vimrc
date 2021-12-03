colorscheme delek
syntax on
set title

language ja_JP.UTF-8
set encoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,sjis
 
set nocompatible
set nobackup
set nonumber
set ruler

set autoindent
set cindent

set showmode
set showmatch
set showcmd

set shiftwidth=2
set tabstop=2	
set expandtab

" setting status line
set laststatus=2

set statusline=\[%n] "number of buffer
set statusline=\%m  
set statusline+=\ %F "file name
set statusline+=\ %r\ %h\ %w
set statusline+=\ [%{&fileencoding}]\ [%{&filetype}]
set statusline+=%= 
set statusline+=\ (%l,%c)
set statusline+=\ (%3p%%) 

"LaTeX setting
"begin suffixes=.tex
"end suffixes

" REQUIRED. This makes vim invoke latex-suite when you open a tex file.
"filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that
"latex can be called correctly.
:set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse latex-suite. Set your grep
" program to alway generate a file-name.
  set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.  
filetype indent on

" compile command
let g:Tex_CompileRule_dvi = 'platex $*'

" dvi-viewer
let g:Tex_ViewRule_dvi = 'mxdvi'
