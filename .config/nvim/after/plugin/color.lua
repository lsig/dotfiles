-- vim.g.tokyonight_transparent_sidebar = true
-- vim.g.tokyonight_transparent = true
-- vim.g.background = "dark"
--
-- vim.cmd("colorscheme tokyonight-night")

require("catppuccin").setup({
	show_end_of_buffer = true,
	transparent_background = false,
	integrations = {
		cmp = true,
		gitsigns = true,
		telescope = true,
		fidget = true,
		lsp_saga = true,
		mason = true,
		lsp_trouble = true,
	},
})

vim.cmd("colorscheme catppuccin")
