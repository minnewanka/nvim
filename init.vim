call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'vim-airline/vim-airline'
Plug 'easymotion/vim-easymotion'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-renderer-devicons.vim'
Plug 'airblade/vim-gitgutter'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-line'
Plug 'mattn/emmet-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'AndrewRadev/tagalong.vim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'mhinz/vim-startify'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'bagrat/vim-buffet'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

"""""j"""""" BASIC SETTINGS """"""""""
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
set nowrap
set smartcase
set ignorecase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
" set colorcolumn=100
set noshowmode
set updatetime=50
set shortmess+=c
set splitbelow
set splitright
" highlight ColorColumn ctermbg=0 guibg=lightgrey
highlight! CursorLine ctermbg=0 guibg=grey


""""""""""" BASIC MAPPING """"""""""

nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap Q <Nop>
nnoremap <leadej>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>phw :h <C-R>=expand("<cword>")<CR><CR>
noremap K 5k
noremap J 5j
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
nmap <leader>g; :diffget //3<CR>
nmap <leader>gj :diffget //2<CR>
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
nnoremap ^ <C-^>
vnoremap <leader>p "_dP
vnoremap < <gv
vnoremap > >gv
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")
nnoremap <silent> <A-j>    :resize -5<CR>
nnoremap <silent> <A-k>  :resize +5<CR>
nnoremap <silent> <A-h>  :vertical resize -5<CR>
nnoremap <silent> <A-l> :vertical resize +5<CR>
nnoremap <C-t>n :tabnew %<CR>
nnoremap <C-t>o :tabonly<CR>
nnoremap <C-t>q :tabclose<CR>
nnoremap <C-t>bo :Bonly<CR>
nnoremap <C-t>bq :Bw<CR>
nmap <C-U> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
nmap <C-D> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>

""""""""""" THEME """"""""""
if has('termguicolors')
    set termguicolors
endif
let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material
set background=dark
let g:gruvbox_material_visual = 'blue background'
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_enable_italic = 1
" let g:gruvbox_material_menu_selection_background = 'grey'
let g:gruvbox_invert_selection='0'


function! g:BuffetSetCustomColors()
  hi! BuffetTab  guibg=#fe8019
  hi! BuffetCurrentBuffer guifg=#282828 guibg=#8ec079
  hi! BuffetActiveBuffer guifg=#000000 guibg=#458588
  hi! BuffetBuffer guifg=#a89984 guibg=#282828
endfunction

augroup FugitiveCustom
    autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END




luafile $HOME/.config/nvim/lua/plug-colorizer.lua

if executable('rg')
    let g:rg_derive_root='true'
endif

""""""""""" Plugin  """"""""""

" Disable netrw.
let g:loaded_netrw  = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

augroup my-fern-hijack
  autocmd!
  autocmd BufEnter * ++nested call s:hijack_directory()
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

let g:fern#renderer = "devicons"

noremap <silent> <Leader>f :Fern . -drawer -reveal=%  -width=35<CR><C-w>=

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



" CoC
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

let g:coc_snippet_next = '<tab>'
let g:coc_global_extensions = [
      \'coc-tsserver',
      \'coc-eslint',
      \'coc-prettier',
      \'coc-json',
      \'coc-styled-components',
      \'coc-css',
      \]

nnoremap <silent> <leader>b :Telescope buffers<CR>
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<CR>
nnoremap <leader>gb  :<C-u>CocList buffers<CR>
nnoremap <leader>ac  :CocAction<CR>
nnoremap <leader>cr :CocRestart<CR>
nnoremap <silent> gh :call <SID>show_documentation()<CR>
inoremap <silent><expr> <C-space> coc#refresh()
nmap gd <Plug>(coc-definition)
nmap gy <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
nmap gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <F3> :ToggleGStatus<CR>


"GitGutter
nmap ghp <Plug>(GitGutterPreviewHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghs <Plug>(GitGutterStageHunk)
xmap ghs <Plug>(GitGutterStageHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)
nmap gn <Plug>(GitGutterNextHunk)
nmap gp <Plug>(GitGutterPrevHunk)


"Easy motion
let g:EasyMotion_smartcase = 1
let g:easymotion#is_active = 0
hi link EasyMotionTarget yellow
hi link EasyMotionIncSearch red
nmap s <Plug>(easymotion-overwin-f2)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
nmap f <Plug>(easymotion-bd-fl)
nmap t <Plug>(easymotion-bd-tl)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>J <Plug>(easymotion-eol-j)
map <Leader>K <Plug>(easymotion-eol-k)

"Airline
let g:airline#extensions#tabline#formatter = 'unique_tail'

"Maximazer
nnoremap <C-W>m :MaximizerToggle<CR>
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

"Closetab
let g:closetag_filenames = '*.html,*.js,*.tsx,*.jsx'

"TagAlong
let g:tagalong_additional_filetypes = ['javascript']

"MultiSelect
let g:VM_show_warnings = 0

"Startify
map <leader>s :CocSearch <Space>
let g:startify_custom_header = [
        \ '   _  __     _      ',
        \ '  / |/ /  __(_)_ _  ',
        \ ' /    / |/ / /  ` \ ',
        \ '/_/|_/|___/_/_/_/_/ ',
        \]
let g:startify_lists = [
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'files',     'header': ['   Files']            },
          \ ]
let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' }]



"Vimspector
let g:vimspector_enable_mappings = 'HUMAN'
nnoremap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>db <Plug>VimspectorToggleBreakpoint


"Vim Buffet
noremap <Left>  :bp<CR>
noremap <Right> :bn<CR>
noremap <Leader><Tab> gt
noremap <C-b>o :Bonly<CR>
let g:buffet_tab_icon = "\uf00a"
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"
let g:buffet_show_index=1
nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <!-- <Plug> -->BuffetSwitch(5)


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
nmap <F3> :ToggleGStatus<CR>

augroup focus
    autocmd!
    autocmd FocusLost,BufLeave * silent! wa
augroup END

" kill-all but visible buffers
nnoremap <silent> <M-BS> :call Delete_buffers()<CR>:echo "Non-windowed buffers are deleted"<CR>

"" Delete all(saved) but visible buffers
func! Delete_buffers()
    let l:buffers = filter(getbufinfo(), {_, v -> v.hidden})
    if !empty(l:buffers)
        execute 'bwipeout' join(map(l:buffers, {_, v -> v.bufnr}))
    endif
endfunc


inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<!-- <TAB> -->" :
      \ coc#refresh()

function! s:check_back_space() abort
let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=0 Syntaxreact set syntax=typescriptreact
autocmd User EasyMotionPromptBegin silent! CocDisable
autocmd User EasyMotionPromptEnd silent! CocEnable


