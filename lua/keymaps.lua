local builtin = require('telescope.builtin')

function Map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- KEYMAPS -- 

-- LEADER -- 
vim.g.mapleader = " "

-- TELESCOPE -- 
Map('n', '<leader>ff', builtin.find_files, {})
Map('n', '<leader>fw', builtin.live_grep, {})
Map('n', '<leader>e', builtin.buffers, {})

-- WRITING & QUITING --
Map('n', '<Leader>w', ':write<CR>')
Map('n', '<Leader>a', ':wqa<CR>')
Map('n', '<Leader>q', ':wq<CR>')

-- REDO --
Map('n', 'U', '<C-r>', {})
