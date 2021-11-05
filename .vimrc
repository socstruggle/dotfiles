unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim
syntax enable
colors apprentice
set shiftwidth=2
set guioptions-=m
set guicursor+=a:blinkon0
set laststatus=2
set statusline=%F
set hlsearch
set formatoptions-=cro
nnoremap * :keepjumps normal! mi*`i<CR>
nnoremap <f1> :bp<CR>
nnoremap <f2> :bn<CR>
nnoremap <f11> :ToggleBufExplorer<CR>
nnoremap <f10> :E<CR>
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
nnoremap <M-v> <C-w>v
nnoremap <M-c> <C-w>s
nnoremap <M-x> <C-w>c
nnoremap <M-f> <C-f>
nnoremap <M-u> <C-u>
nnoremap <M-w> <C-w>k
nnoremap <M-s> <C-w>j
nnoremap <M-a> <C-w>h
nnoremap <M-d> <C-w>l
nnoremap <M-o> <C-w>o
nnoremap <M-n> :tabe<CR>
nnoremap <M-i> :tabp<CR>
nnoremap <M-,> :tabn<CR>
nnoremap f <C-f>
nnoremap F <C-u>
nmap t% :tabe %<CR>
nmap td :tabc<CR>