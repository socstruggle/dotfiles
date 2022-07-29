unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

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
set foldmethod=syntax
set nowrap

execute "set <M-v>=\ev"
execute "set <M-d>=\ed"
execute "set <M-a>=\ea"
execute "set <M-c>=\ec"
execute "set <M-w>=\ew"
execute "set <M-f>=\ef"
execute "set <M-u>=\eu"
execute "set <M-x>=\ex"
execute "set <M-s>=\es"
execute "set <M-h>=\eh"
execute "set <M-j>=\ej"
execute "set <M-k>=\ek"
execute "set <M-l>=\el"
execute "set <M-o>=\eo"
execute "set <M-i>=\ei"
execute "set <M-,>=\e,"
execute "set <M-n>=\en"
execute "set <M-e>=\ee"

nnoremap * :keepjumps normal! mi*`i<CR>
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
nnoremap f <C-f>
nnoremap F <C-u>
nmap tt :tabe %<CR>
nmap tr :tabp<CR>
nmap ty :tabn<CR>
nmap tx :tabc<CR>
nnoremap <Space> za
