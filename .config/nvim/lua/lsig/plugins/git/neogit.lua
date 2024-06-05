return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- Diff integration
		"nvim-telescope/telescope.nvim",
	},
	cmd = "Neogit",
	keys = {
		{ "<Leader>gs", "<cmd>Neogit kind=vsplit<CR>", desc = "Neogit" },
	},
	config = true,
	event = "BufEnter",
}
