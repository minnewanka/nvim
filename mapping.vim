nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>phw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
noremap K 5k
noremap J 5j
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>
nnoremap go o<Esc>k
nnoremap gO O<Esc>j
nnoremap <leader>gc :GCheckout<CR>
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
nmap <leader>g; :diffget //3<CR>
nmap <leader>gj :diffget //2<CR>
nmap <D-j> <C-d>
imap jk <Esc>
imap kj <Esc>
imap jj <Esc>
nnoremap <leader>q :q<cr>
nnoremap <leader>z :wq<cr>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap Y y$
vnoremap <leader>y "*e
nnoremap ^ <C-^>
vnoremap <leader>p "_dP
" xnoremap <A-j> :move '<-2<CR>gv-gv
" xnoremap <A-k> :move '>+1<CR>gv-gv
" Better indenting
vnoremap < <gv
vnoremap > >gv
" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")
nnoremap <silent> <A-j>    :resize -2<CR>
nnoremap <silent> <A-k>  :resize +2<CR>
nnoremap <silent> <A-h>  :vertical resize -2<CR>
nnoremap <silent> <A-l> :vertical resize +2<CR>
