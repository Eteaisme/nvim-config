return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },

  keys = {
    { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find files" },
    { "<leader>fw", function() require("telescope.builtin").live_grep() end, desc = "Live grep" },
  },

  config = function()
    require("telescope").setup({
      defaults = {
        prompt_prefix = "🔍 ",
      },
    })
  end,
}
