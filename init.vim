
function! g:BuffetSetCustomColors()
  hi! BuffetTab  guibg=#fe8019
  hi! BuffetCurrentBuffer guifg=#282828 guibg=#8ec079
  hi! BuffetActiveBuffer guifg=#000000 guibg=#458588
  hi! BuffetBuffer guifg=#a89984 guibg=#282828
endfunction

source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/commands.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/theme.vim
source $HOME/.config/nvim/mapping.vim
source $HOME/.config/nvim/plugins-settings.vim

luafile $HOME/.config/nvim/lua/plug-colorizer.lua

if executable('rg')
    let g:rg_derive_root='true'
endif
let loaded_matchparen = 1






