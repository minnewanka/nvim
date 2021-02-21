" CoC
let g:coc_snippet_next = '<tab>'
let g:coc_global_extensions = [
      \'coc-tsserver',
      \'coc-eslint',
      \'coc-prettier',
      \'coc-json',
      \'coc-styled-components',
      \'coc-css',
      \]
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<CR>
nnoremap <leader>gb  :<C-u>CocList buffers<CR>
nnoremap <leader>ac  :CocAction<CR>
nnoremap <leader>cr :CocRestart<CR>
nnoremap <silent> <leader>gh :call <SID>show_documentation()<CR>
inoremap <silent><expr> <C-space> coc#refresh()
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
map <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nmap <F3> :ToggleGStatus<CR>
map <leader>e :NERDTreeFind<CR>

"Colorizer
lua require'colorizer'.setup()

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
let g:airline_section_y=''
let g:airline_section_z=''

"Maximazer
nnoremap <C-W>m :MaximizerToggle<CR>
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

"Barbar
let bufferline = get(g:, 'bufferline', {})
let bufferline.auto_hide = v:true
let bufferline.closable = v:true
nnoremap <silent> <leader>b :BufferPick<CR>
nnoremap <silent> <leader>tc :BufferClose<CR>

"Closetab
let g:closetag_filenames = '*.html,*.js,*.tsx,*.jsx'


"TagAlong
let g:tagalong_additional_filetypes = ['javascript']

"MultiSelect
let g:VM_show_warnings = 0

"Startify
let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' }]

"Snippets
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]


"Vimspector
let g:vimspector_enable_mappings = 'HUMAN'
nnoremap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>db <Plug>VimspectorToggleBreakpoint
