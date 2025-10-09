local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "catppuccin/nvim",
        lazy = false, -- colorscheme should load immediately
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("catppuccin-macchiato")
        end,
    },

{
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdateSync",
    config = function()
        vim.defer_fn(function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "lua", "vim", "cpp" },
                auto_install = false,
                highlight = {
                    enable = true,
                    disable = function(lang, buf)
                        local max_filesize = 100 * 1024
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            return true
                        end
                    end,
                },
                indent = { enable = false },
            })
        end, 100)
    end,
},

    { "nvim-treesitter/nvim-treesitter-textobjects", lazy = true },

    {
        "neovim/nvim-lspconfig",
        event = { "VeryLazy", "BufReadPre", "BufNewFile" },
    },

    {
        "williamboman/mason.nvim",
        cmd = { "Mason" },
        config = function()
            require("mason").setup()
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "mason.nvim" },
        event = "BufReadPre",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls" },
                handlers = {
                    function(server)
                        require("lspconfig")[server].setup({
                            settings = {
                                Lua = { diagnostics = { globals = { "vim" } } },
                            },
                        })
                    end,
                },
            })
        end,
    },

    {
        "m4xshen/hardtime.nvim",
        event = "VeryLazy",
        dependencies = { "MunifTanjim/nui.nvim" },
        config = function()
            require("hardtime").setup()
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local actions = require("telescope.actions")
            require("telescope").setup({
                defaults = {
                    mappings = {
                        i = { ["<esc>"] = actions.close },
                    },
                },
            })
        end,
    },

    {
        "nvim-lualine/lualine.nvim",
        event = "VimEnter",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup()
        end,
    },

    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = { "markdown" },
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },
        config = function()
            require("render-markdown").setup({})
        end,
    },

    {
        "stevearc/oil.nvim",
        cmd = "Oil",
        dependencies = { { "nvim-mini/mini.icons", opts = {} } },
        config = function()
            require("oil").setup()
        end,
    },
})
