if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup redhat
  autocmd!
  " In text files, always limit the width of text to 78 characters
  " autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/run/media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add $PWD/cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

filetype plugin on

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"
"unlet! skip_defaults_vim
"source $VIMRUNTIME/defaults.vim

"syntax enable
syntax on
set background=dark
colorscheme scheakur
set shiftwidth=2
set tabstop=2
set expandtab
set guioptions-=m
set guicursor+=a:blinkon0
set autochdir
set laststatus=2
"set statusline=%F
set hlsearch
set formatoptions-=cro
set ignorecase
"set foldmethod=syntax
set nowrap

"execute "set <M-v>=\ev"
"execute "set <M-d>=\ed"
"execute "set <M-a>=\ea"
"execute "set <M-c>=\ec"
"execute "set <M-w>=\ew"
"execute "set <M-f>=\ef"
"execute "set <M-u>=\eu"
"execute "set <M-x>=\ex"
"execute "set <M-s>=\es"
"execute "set <M-h>=\eh"
"execute "set <M-j>=\ej"
"execute "set <M-k>=\ek"
"execute "set <M-l>=\el"
"execute "set <M-o>=\eo"
"execute "set <M-i>=\ei"
"execute "set <M-,>=\e,"
"execute "set <M-n>=\en"
"execute "set <M-e>=\ee"

"nnoremap * :keepjumps normal! mi*`i<CR>
nnoremap <silent> * :let @/= '\<' . expand('<cword>') . '\>' <bar> set hls <cr>
nnoremap <M-e> :E<CR>
nnoremap <M-v> <C-w>v
nnoremap <M-c> <C-w>s
nnoremap <M-x> <C-w>c
nnoremap <M-f> <C-f>
nnoremap <M-u> <C-u>
nnoremap <M-w> <C-w>k
nnoremap <M-s> <C-w>j
nnoremap <M-a> <C-w>h
nnoremap <M-d> <C-w>l
nmap <M-o> <C-w>o
nnoremap <M-n> :tabe<CR>
nnoremap <M-i> :tabp<CR>
nnoremap <M-,> :tabn<CR>
"nnoremap f <C-f>
"nnoremap F <C-u>
nmap tt :tabe %<CR>
nmap tr :tabp<CR>
nmap H :tabp<CR>
nmap ty :tabn<CR>
nmap L :tabn<CR>
nmap tx :tabc<CR>
"nnoremap <Space> za

nnoremap fh <C-w>h
nnoremap fl <C-w>l
nnoremap fk <C-w>k
nnoremap fj <C-w>j
nnoremap fx <C-w>c
nnoremap fs <C-w>s
nnoremap fv <C-w>v
nmap fo <C-w>o
"nnoremap ff <C-f>
"nnoremap fu <C-u>

nnoremap gf <C-g>

if &diff
  set noro
endif

function! Samew()
  call feedkeys("\<c-w>=")
endfunction

command! Samew call Samew()

function! Fullp()
  call feedkeys("1\<c-g>")
endfunction

command! Fullp call Fullp()

set noswapfile
