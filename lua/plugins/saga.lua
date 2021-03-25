local saga = require 'lspsaga'

saga.init_lsp_saga {
    code_action_icon = '💡',
    code_action_prompt = {
        enable = true,
        sign = true,
        sign_priority = 20,
        virtual_text = false,
    },
    finder_action_keys = {
        open = '<CR>', vsplit = 'v',split = 's',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
    },
    code_action_keys = { quit = {'q', '<ESC>'}, exec = '<CR>' },
    border_style = 2,
}
