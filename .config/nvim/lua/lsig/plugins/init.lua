return {
	{ "nvim-lua/plenary.nvim" },
	{ "tpope/vim-sleuth", event = "VeryLazy" },
	{ "echasnovski/mini.surround", opts = {}, version = "*" },
	{ "echasnovski/mini.pairs", opts = {}, version = "*" },
	{ "numToStr/Comment.nvim", opts = {}, event = "VeryLazy" },
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		opts = {},
		event = "VeryLazy",
	},
	{
		"j-hui/fidget.nvim",
		opts = {},
	},
	{ "christoomey/vim-tmux-navigator", event = "VeryLazy" },
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
}
