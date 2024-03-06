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

"nnoremap j jzz
"nnoremap k kzz
"nnoremap n nzz

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
nnoremap f+ <C-w>+
nnoremap f- <C-w>-
nnoremap f> <C-w>>
nnoremap f< <C-w><
"nnoremap k kzz
"nnoremap j jzz

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

"function! CenterSearch()
"  let cmdtype = getcmdtype()
"  if cmdtype == '/' || cmdtype == '?'
"    return "\<enter>zz"
"  endif
"  return "\<enter>"
"endfunction
"
"cnoremap <silent> <expr> <enter> CenterSearch()
":nnoremap / :execute "normal! /\<lt>cr>zz"<c-left><right>

"function! CenteredFindNext(forward)
"    " save the current value for later restore
"    let s:so_curr=&scrolloff
"    set scrolloff=999
"    try
"        if a:forward
"            silent normal! n
"        else
"            silent normal! N
"        endif
"    finally
"        " restore no matter what
"        let &scrolloff=s:so_curr
"    endtry
"endfunction
"
":nnoremap <silent>n :call CenteredFindNext(1)<CR>
":nnoremap <silent>N :call CenteredFindNext(0)<CR>
