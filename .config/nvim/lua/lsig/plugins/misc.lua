return {
  { "nvim-lua/plenary.nvim" },
  { "tpope/vim-sleuth", event = "VeryLazy" },
  { "echasnovski/mini.surround", opts = {}, version = "*" },
  { "echasnovski/mini.pairs", opts = {}, version = "*" },
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    opts = {},
    event = "VeryLazy",
  },
  {
    "j-hui/fidget.nvim",
    opts = {
      notification = {
        override_vim_notify = true, -- Automatically override vim.notify() with Fidget
        window = {
          align = "top",
        },
      },
    },
  },
  { "christoomey/vim-tmux-navigator", event = "VeryLazy" },
  {
    "stevearc/oil.nvim",
    opts = {
      keymaps = { ["<C-t>"] = false },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}
