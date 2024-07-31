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
  -- {
  --   "m4xshen/hardtime.nvim",
  --   dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  --   opts = {},
  -- },
  {
    "lsig/messenger.nvim",
    event = "VeryLazy",
    config = function()
      require("messenger").setup()
    end,
  },
}
