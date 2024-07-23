set nu sw=4 ts=4 noswapfile smartindent incsearch
syntax on

let g:mapleader = ' '
nnoremap <leader>e :Ex<CR>
nmap <leader>w <C-w>
nmap <leader>y "+y
nmap <C-p> :FZF<CR>

set rtp+=/opt/homebrew/opt/fzf
autocmd FileType gitcommit,markdown setlocal spell

