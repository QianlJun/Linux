syntax on

set number
set cursorline
set wrap
set showcmd
set wildmenu
set hlsearch
set incsearch
set ignorecase
set smartcase
set nocompatible
set scrolloff=10
set backspace=2
set t_Co=256
set background=dark

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set encoding=utf-8
let &t_ut=''

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

map s <nop>

noremap j k
noremap k j 
inoremap <C-u> <esc>gUiwea

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'jiangmiao/auto-pairs'

" Auto Complete
Plug 'Valloric/YouCompleteMe'


call plug#end()

colorscheme molokai

autocmd BufNewFile *.c,*.cpp,*.sh,*.py,*.java,*.R exec ":call SetTitle()"
func SetTitle()
	if (&filetype == 'c' || &filetype == 'cpp')
		call setline(1,"/*************************************************")
		call setline(2,"\@Author:QianJun")
		call setline(3,"\@Created Time:".strftime("%c"))
		call setline(4,"\@File Name:".expand("%"))
		call setline(5,"\@Description:")
		call setline(6,"*************************************************/")
		call setline(7,"")
	endif

	if &filetype == 'sh'
		call setline(1,"\#!/bin/sh")
		call setline(2,"\#Author:QianJun")
		call setline(3,"\#Created Time:".strftime("%c"))
		call setline(4,"\#File Name:".expand("%"))
		call setline(5,"\#Description:")
		call setline(6,"")
	endif

	if &filetype == 'python'
		call setline(1,"\#!/usr/bin/env python")	
		call setline(2,"\# -*- coding=utf8 -*-")
		call setline(3,"\"\"\"")
		call setline(4,"\#Author:QianJun")
		call setline(5,"\#Created Time:".strftime("%c"))
		call setline(6,"\#File Name:".expand("%"))
		call setline(7,"\#Description:")
		call setline(8,"\"\"\"")
		call setline(9,"")
	endif

	if &filetype == 'java'
		call setline(1,"//coding=utf8")	
		call setline(2,"/**")
		call setline(3,"\*\@Author:QianJun")
		call setline(4,"\*\@Created Time:".strftime("%c"))
		call setline(5,"\*\@File Name:".expand("%"))
		call setline(6,"\*\@Description:")
		call setline(7,"\*/")
		call setline(8,"")
	endif

	if &filetype == 'R'
		call setline(1,"##################################################")
		call setline(2,"\#Author:QianJun")
		call setline(3,"\#Created Time:".strftime("%c"))
		call setline(4,"\#File Name:".expand("%"))
		call setline(5,"\#Description:")
		call setline(6,"##################################################")
		call setline(7,"")
	endif
endfunc
autocmd BufNewfile * normal G
