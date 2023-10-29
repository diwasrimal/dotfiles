set number relativenumber
set shiftwidth=4 tabstop=4 expandtab smarttab
set ignorecase smartcase
set pumheight=15
set splitright splitbelow
set undofile noswapfile
set nowrap
set rtp+=/opt/homebrew/opt/fzf

let g:mapleader = ' '
map <leader>w <c-w>
map <leader>y "+y
map <leader>Y "+Y
map <leader>x <cmd>bdelete<cr>
nnoremap <c-p> <cmd>FZF<cr>
nnoremap <leader>e <cmd>Explore<cr>

autocmd FileType markdown,gitcommit setlocal spell
