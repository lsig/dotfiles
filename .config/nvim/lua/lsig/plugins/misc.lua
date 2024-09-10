return {
  { "tpope/vim-sleuth", event = "VeryLazy" },
  { "christoomey/vim-tmux-navigator", event = "VeryLazy" },
  { "mbbill/undotree", event = "VeryLazy" },
  {
    "stevearc/oil.nvim",
    opts = {
      default_file_explorer = true,
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      keymaps = { ["<C-t>"] = false },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {},
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
  },
  {
    dir = "~/repos/messenger.nvim", -- Your path
    name = "messenger",
    event = "VeryLazy",
    opts = {
      border = "rounded",
    },
  },
}
