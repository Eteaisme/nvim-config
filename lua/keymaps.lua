--[[
    
    * Space ff -> Find File
    * Space fw -> Find word 
    * Shift Enter -> Newline 
    * Space Enter -> New terminal buffer in insert 
    * Space q -> Write & Quit
    * Space w -> Write 
    * Space e -> File tree?? 


--]]
function Map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

vim.g.mapleader = " "

