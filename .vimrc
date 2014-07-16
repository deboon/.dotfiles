" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2002 Sep 19
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif
"vim mappings
"insert currecnt date

map <F5> a<C-R>=strftime("%c")<CR><Esc> 
map <F6> <Esc> :w <CR> :!perl -I/www/lib -c ./%<CR>

" Don't use x mode, use Q for formatting
map Q gq

"map <C-Z> :shell 

" Use F7 to chose encoding
set wildmenu
set wcm=<Tab>
menu Encoding.koi8-r :e ++enc=koi8-r ++ff=unix<CR>
menu Encoding.windows-1251 :e ++enc=cp1251 ++ff=dos<CR>
menu Encoding.cp866 :e ++enc=cp866 ++ff=dos<CR>
menu Encoding.utf-8 :e ++enc=utf-8 <CR>
menu Encoding.koi8-u :e ++enc=koi8-u ++ff=unix<CR>
map <F7> :emenu Encoding.<TAB>

" Movement between tabs OR buffers
map <F10> :call FNextTab()<CR>
map <F9> :call FPrevTab()<CR>

function! FNextTab()
    if exists( '*tabpagenr' ) && tabpagenr('$') != 1
        " Tab support && tabs open
        normal gt
    else
        " No tab support, or no tabs open
        execute ":bnext"
    endif
endfunction

function! FPrevTab()
    if exists( '*tabpagenr' ) && tabpagenr('$') != '1'
        " Tab support && tabs open
        normal gT
    else
        " No tab support, or no tabs open
        execute ":bprev"
    endif
endfunction


"S-F9 - по SHIFT-F9
":!cc - запускаем С компилятор
"% - имя текущего файла
"%< - имя текущего файла без расширения

"if exists('+colorcolumn')
"  set colorcolumn=80,120
"  highlight ColorColumn ctermbg=darkmagenta guibg=darkmagenta
"endif
      
set nocompatible
"
" allow backspacing over everything in insert mode
"set backspace=indent,eol,start

set number 
set autoindent 
" http://vim.wikia.com/wiki/Converting_tabs_to_spaces
set tabstop=2
set shiftwidth=2
set expandtab
" :retab

" Remove_unwanted_spaces
autocmd FileType c,cpp,java,perl autocmd BufWritePre <buffer> :%s/\s\+$//e

 
set noignorecase " Не игнорировать регистр букв при поиске
"set list " Включить подсветку невидимых символов
"set listchars=tab:·\ ,trail:· " Настройка подсветки невидимых символов
"set iminsert=0 " Раскладка по умолчанию - английская

" enable folding
set foldcolumn=1
set foldmethod=syntax
set foldlevelstart=1
let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

"if has("vms")
"  set nobackup		" do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file
"endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set backupskip="/tmp/*,/private/tmp/*"  "  to edit crontab

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
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

  augroup END

else

  set autoindent		" always set autoindenting on

endif 

set encoding=utf-8

