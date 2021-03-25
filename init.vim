call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'sainnhe/gruvbox-material'
Plug 'itchyny/lightline.vim'
Plug 'justinmk/vim-sneak'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'dhruvasagar/vim-zoom'
Plug 'jiangmiao/auto-pairs'
Plug 'windwp/nvim-ts-autotag'
Plug 'romgrk/barbar.nvim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-indent'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'wellle/targets.vim'
Plug 'dyng/ctrlsf.vim'

call plug#end()


""""""""""" BASIC SETTINGS """"""""""
set mouse=a
let mapleader = " "
syntax on
set ruler
set formatoptions-=cro
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set noshowmatch
set expandtab
set smarttab
set autoindent
set smartindent
set number
set relativenumber
set nowrap
set smartcase
set ignorecase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set termguicolors
set noshowmode
set updatetime=50
set shortmess+=c
set splitbelow
set splitright
set encoding=UTF-8

""""""""""" BASIC MAPPING """"""""""

nnoremap <leader>q :q<cr>
nnoremap <leader>z :wq<cr>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap Q <Nop>
nnoremap <leader>phw :h <C-R>=expand("<cword>")<CR><CR>
" noremap K 5k
" noremap J 5j
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
nmap <leader>g; :diffget //3<CR>
nmap <leader>gj :diffget //2<CR>
imap jk <Esc>
imap kj <Esc>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap Y y$
nnoremap ^ <C-^>
vnoremap <leader>p "_dP
vnoremap < <gv
vnoremap > >gv
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")
nnoremap <C-t>n :tabnew %<CR>
nnoremap <C-t>o :tabonly<CR>
nnoremap <C-t>q :tabclose<CR>
nnoremap <C-t>bo :Bonly<CR>
nnoremap <C-t>bq :Bw<CR>
noremap <Left>  :bp<CR>
noremap <Right> :bn<CR>
noremap <Leader><Tab> gt
noremap hl :set hlsearch! hlsearch?<CR>
nnoremap <leader>j :join<CR>



""""""""""" THEME """"""""""
if has('termguicolors')
    set termguicolors
endif
let g:gruvbox_material_background = 'soft'
let g:gruvbox_material_palette='mix'
colorscheme gruvbox-material
highlight Comment cterm=italic gui=italic
set background=dark
let g:gruvbox_material_visual = 'blue background'
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_invert_selection='0'

luafile $HOME/.config/nvim/lua/init.lua
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true },  autotag = { enable = true, } }

""""""""""" Highlights """"""""""

hi BufferCurrent  guifg=#b8bb26
hi BufferCurrentIndex guifg=#b8bb26
hi BufferCurrentSign guifg=#b8bb26
hi bufferVisible guifg=#458588
hi bufferVisibleIndex guifg=#458588
hi bufferVisibleSign guifg=#458588
hi BufferInactive guifg=#ebdbb2
hi BufferInactiveIndex guifg=#ebdbb2
hi BufferInactiveSign guifg=#ebdbb2

highlight Search  guifg=#282828 guibg=#fabd2f
highlight! SneakLabelMask guibg=#282828 guifg=#282828
highlight! link SneakScope DiffText
highlight! link SneakLabel Search
highlight! link Sneak Search

highlight YankHighlight  guifg=#ebdbb2 guibg=#b16286

highlight TelescopeSelection      guifg=#D79921 gui=bold
highlight TelescopeSelectionCaret guifg=#CC241D
highlight TelescopeMatching       guifg=#458588

" highlight ctrlsfMatch guifg=#282828 guibg=#8ec07c
highlight link ctrlsfMatch Search

highlight! link LspDiagnosticsDefaultError Red
highlight! link LspDiagnosticsDefaultHint Blue

hi link GitSignsAddNr Red
hi link GitSignsChangeNr Red
hi link GitSignsDeleteNr Red

"Lua


""""""""""" Plugin  """"""""""

if executable('rg')
    let g:rg_derive_root='true'
endif

" Disable netrw.
let g:loaded_netrw  = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

augroup my-fern-hijack
  autocmd!
  autocmd BufEnter * ++nested call s:hijack_directory()
augroup END

augroup FugitiveCustom
    autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

function! s:hijack_directory() abort
  let path = expand('%:p')
  if !isdirectory(path)
    return
  endif
  bwipeout %
  execute printf('Fern %s', fnameescape(path))
endfunction

" Custom settings and mappings.
let g:fern#disable_default_mappings = 1
let g:fern#default_hidden= 1
let g:fern#renderer = "nerdfont"

" noremap <silent> <Leader>f :Fern . -drawer -reveal=%  -width=35<CR><C-w>=

function! FernInit() abort
    nmap <buffer><expr>
                \ <Plug>(fern-my-open-expand-collapse)
                \ fern#smart#leaf(
                \   "\<Plug>(fern-action-open:select)",
                \   "\<Plug>(fern-action-expand)",
                \   "\<Plug>(fern-action-collapse)",
                \ )
    nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
    nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
    nmap <buffer> n <Plug>(fern-action-new-path)
    nmap <buffer> d <Plug>(fern-action-remove)
    nmap <buffer> m <Plug>(fern-action-move)
    nmap <buffer> M <Plug>(fern-action-rename)
    nmap <buffer> r <Plug>(fern-action-reload)
    nmap <buffer> b <Plug>(fern-action-open:split)
    nmap <buffer> v <Plug>(fern-action-open:vsplit)
    nmap <buffer><nowait> < <Plug>(fern-action-leave)
    nmap <buffer><nowait> > <Plug> (fern-action-enter)
endfunction

augroup FernGroup
  autocmd!
  autocmd FileType fern call FernInit()
augroup END

map <leader>s <Plug>CtrlSFPrompt

nnoremap <silent> <leader>b :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>gb :lua require('telescope.builtin').git_branches()<CR>

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
nnoremap <silent> gD <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <silent> gr <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
nnoremap <silent> <Leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
nnoremap <silent> <Leader>rr <cmd>lua require('lspsaga.rename').rename()<CR>
nnoremap <silent> [g <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
nnoremap <silent> ]g <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>
" Compe
" inoremap <silent><expr> <TAB>     compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')


"Sneak
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1

"LightLine
let g:lightline = {
      \ 'enable': { 'tabline': 0 },
      \ 'colorscheme': 'gruvbox_material',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'zoom' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \    'zoom': 'zoom#statusline',
      \ },
      \ }

"Closetab
let g:closetag_filenames = '*.html,*.js,*.tsx,*.jsx'

"TagAlong
let g:tagalong_additional_filetypes = ['javascript']

"Bar bar
let bufferline = get(g:, 'bufferline', {})
let bufferline.animation = v:false
let bufferline.icons = 'numbers'
let bufferline.icon_separator_active = ''
let bufferline.icon_separator_inactive = ''
let bufferline.maximum_padding = 2

nmap <leader>1 :BufferGoto 1<CR>
nmap <leader>2 :BufferGoto 2<CR>
nmap <leader>3 :BufferGoto 3<CR>
nmap <leader>4 :BufferGoto 4<CR>
nmap <leader>5 :BufferGoto 5<CR>
nmap <leader>6 :BufferGoto 6<CR>
nmap <leader>7 :BufferGoto 7<CR>
nmap <leader>8 :BufferGoto 8<CR>
nmap <leader>9 :BufferGoto 9<CR>


"""""""""" COMMAND """"""""""
autocmd BufWinEnter * set  formatoptions-=cro

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

function! ToggleGStatus()
    if buflisted(bufname('.git/index'))
        bd .git/index
    else
        Gstatus
    endif
endfunction
command ToggleGStatus :call ToggleGStatus()

augroup focus
    autocmd!
    autocmd FocusLost,BufLeave * silent! wa
augroup END

nnoremap <silent> <M-BS> :call Delete_buffers()<CR>:echo "Non-windowed buffers are deleted"<CR>

func! Delete_buffers()
    let l:buffers = filter(getbufinfo(), {_, v -> v.hidden})
    if !empty(l:buffers)
        execute 'bwipeout' join(map(l:buffers, {_, v -> v.bufnr}))
    endif
endfunc

function! s:check_back_space() abort
let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

command! -nargs=0 Syntaxreact set syntax=typescriptreact

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="YankHighlight", timeout=700}
augroup END


" autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync(nil, 100)
nnoremap <silent> <leader>f    <cmd>lua vim.lsp.buf.formatting()<CR>

