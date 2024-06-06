return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    -- load the colorscheme here
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
  end,
}
