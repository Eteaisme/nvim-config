function Map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end
local builtin = require('telescope.builtin')

-- KEYMAPS -- 

-- LEADER -- 
vim.g.mapleader = " "

-- TELESCOPE -- 
Map('n', '<leader>ff', builtin.find_files, {})
Map('n', '<leader>fw', builtin.live_grep, {})

-- WRITING & QUITING --
Map('n', '<Leader>w', ':write<CR>')
Map('n', '<Leader>a', ':wqa<CR>')
Map('n', '<Leader>x', ':wq<CR>')

-- REDO --
Map('n', 'U', '<C-r>', {})
