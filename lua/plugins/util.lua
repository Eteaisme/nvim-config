return {
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
	{
		"tpope/vim-fugitive",
	},
	{
		"lewis6991/gitsigns.nvim",
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
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
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },

		keys = {
			{
				"<leader>ff",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find files",
			},
			{
				"<leader>fw",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Live grep",
			},
		},

		config = function()
			require("telescope").setup({
				defaults = {
					prompt_prefix = "🔍 ",
					file_ignore_patterns = {
						"%.exe$",
						"%.o$",
						"%.a$",
						"%.out$",
						"%.so$",
						"%.png$",
						"%.jpg$",
						"%.jpeg$",
						"%.gif$",
						"%.bmp$",
						"%.pdf$",
						"%.zip$",
						"%.tar$",
						"%.gz$",
						"%.7z$",
						"%.mp4$",
						"%.mp3$",
						"%.avi$",
						"%.mkv$",
						"%.mov$",
					},
				},
			})
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
}
