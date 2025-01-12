-- Disable line numbers inside terminal
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

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
  -- {
  --   "sphamba/smear-cursor.nvim",
  --   opts = {},
  -- },
  {
    dir = "~/repos/messenger.nvim", -- Your path
    name = "messenger",
    event = "VeryLazy",
    opts = {
      border = "rounded",
    },
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {},
  },
}
