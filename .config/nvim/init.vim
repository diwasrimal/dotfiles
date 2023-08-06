set number relativenumber
set tabstop=4 shiftwidth=4 smarttab expandtab
set ignorecase smartcase hlsearch
set noswapfile
set undofile
set nowrap
set pumheight=10
set splitright splitbelow

let g:mapleader=' '
map <leader>y "+y
nmap <leader>w <C-w>
nmap <leader>Y "+Y
nnoremap <leader>to <cmd>tabnew<cr>
nnoremap <leader>tn <cmd>tabnext<cr>
nnoremap <leader>tp <cmd>tabprev<cr>
nnoremap <leader>tq <cmd>tabclose<cr>
nnoremap <leader>qo <cmd>copen<cr>
nnoremap <leader>qq <cmd>cclose<cr>
nnoremap <leader>qn <cmd>cnext<cr>
nnoremap <leader>qp <cmd>cprev<cr>

autocmd FileType markdown,gitcommit set spell
autocmd FileType javascriptreact,typescriptreact,html set sw=2 ts=2

call plug#begin()
Plug 'sainnhe/sonokai'
call plug#end()

colorscheme sonokai
