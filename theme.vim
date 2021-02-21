let g:gruvbox_material_visual = 'blue background'
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_menu_selection_background = 'blue'
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection='0'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
colorscheme gruvbox-material
set background=dark
