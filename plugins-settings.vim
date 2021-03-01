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
 nnoremap <silent> <leader>b :Buffers<CR>
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
map <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nmap <F3> :ToggleGStatus<CR>
map <leader>e :NERDTreeFind<CR>


"GitGutter
nmap  ghp <Plug>(GitGutterPreviewHunk)
nmap  ghu <Plug>(GitGutterUndoHunk)
nmap  ghs <Plug>(GitGutterStageHunk)
xmap  ghs <Plug>(GitGutterStageHunk)

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

"Barbar
" let bufferline = get(g:, 'bufferline', {})
" let bufferline.auto_hide = v:true
" let bufferline.closable = v:true
" nnoremap <silent> <leader>b :BufferPick<CR>
" nnoremap <silent> <leader>tc :BufferClose<CR>
" nnoremap <silent> <leader>to :BufferCloseAllButCurrent<CR>

"Closetab
let g:closetag_filenames = '*.html,*.js,*.tsx,*.jsx'


"TagAlong
let g:tagalong_additional_filetypes = ['javascript']

"MultiSelect
let g:VM_show_warnings = 0

"Startify
map <leader>s :Startify<CR>
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

"Snippets
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]


"Vimspector
let g:vimspector_enable_mappings = 'HUMAN'
nnoremap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>db <Plug>VimspectorToggleBreakpoint


"Vim Buffet
noremap <Left>  :bp<CR>
noremap <Right> :bn<CR>
noremap <leader>bb :Bw<CR>
noremap <leader>bo :Bonly<CR>
let g:buffet_tab_icon = "\uf00a"
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"
nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)

