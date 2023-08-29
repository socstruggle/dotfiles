syntax on
set background=dark
colorscheme desertink
set shiftwidth=2
set tabstop=2
set expandtab
set guioptions-=m
set guicursor+=a:blinkon0
set autochdir
set laststatus=2
set hlsearch
set formatoptions-=cro
set ignorecase
set nowrap
set noswapfile

nnoremap <silent> * :let @/= '\<' . expand('<cword>') . '\>' <bar> set hls <cr>
nnoremap tt :tabe %<CR>
nnoremap tr :tabp<CR>
nnoremap ty :tabn<CR>
nnoremap tx :tabc<CR>
nnoremap fh <C-w>h
nnoremap fl <C-w>l
nnoremap fk <C-w>k
nnoremap fj <C-w>j
nnoremap fx <C-w>c
nnoremap fs <C-w>s
nnoremap fv <C-w>v
nnoremap fo <C-w>o

if &diff
  set noro
endif

function! Get()
  :silent execute (":r!tclsh /putget/get.tcl")
endfunction

command! Get call Get()

function! Putl()
  :silent execute (":.:w !tclsh /putget/put.tcl")
endfunction

command! Putl call Putl()

function! Putb()
  :silent execute (":%:w !tclsh /putget/put.tcl")
endfunction

command! Putb call Putb()

function! Putv()
  :silent execuke (":'<,'>:w !tclsh /putget/put.tcl")
endfunction

command! Putv call Putv()

function! Samew()
  call feedkeys("\<c-w>=")
endfunction

command! Samew call Samew()

function! Fullp()
  call feedkeys("1\<c-g>")
endfunction

command! Fullp call Fullp()

