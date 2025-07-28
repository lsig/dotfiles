return {
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require("mini.ai").setup()
      require("mini.doc").setup()
      require("mini.pick").setup({
        mappings = {
          choose_marked = "<C-q>",
        },
      })
      require("mini.pairs").setup({
        modes = { insert = true, command = true, terminal = true },
      })
      require("mini.icons").setup()
      require("mini.extra").setup()
      require("mini.comment").setup()
      require("mini.surround").setup()
      require("mini.bracketed").setup()
      require("mini.bufremove").setup()
      require("mini.trailspace").setup()

      -- Basics
      require("mini.basics").setup({
        options = {
          -- Manage options manually
          basic = false,
        },
        mappings = {
          windows = true,
          move_with_alt = true,
        },
      })

      -- Git
      require("mini.git").setup()
      require("mini.diff").setup({
        view = {
          style = "sign",
          signs = { add = "+", change = "~", delete = "-" },
        },
      })
    end,
  },
}
