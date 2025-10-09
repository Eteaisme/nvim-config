return{
	"stevearc/oil.nvim",
        cmd = "Oil",
        dependencies = { { "nvim-mini/mini.icons", opts = {} } },
        config = function()
            require("oil").setup()
        end,
}
