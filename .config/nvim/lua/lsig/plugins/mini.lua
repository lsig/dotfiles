return {
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require("mini.ai").setup()
      require("mini.pairs").setup({
        modes = { insert = true, command = true, terminal = true },
      })
      require("mini.comment").setup()
      require("mini.surround").setup()
      require("mini.bufremove").setup()
      require("mini.cursorword").setup()
      require("mini.trailspace").setup()

      -- Git
      require("mini.git").setup()
      require("mini.diff").setup({
        view = {
          style = "sign",
          signs = { add = "+", change = "~", delete = "-" },
        },
      })

      -- Hop config
      require("mini.jump2d").setup({
        view = { dim = true },
        mappings = {
          start_jumping = ";",
        },
      })

      -- Hipattern setup
      local hipatterns = require("mini.hipatterns")
      hipatterns.setup({
        highlighters = {
          -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
          fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
          hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
          todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
          note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

          -- Highlight hex color strings (`#rrggbb`) using that color
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      })

      -- Notify setup
      local notify = require("mini.notify")
      notify.setup({
        window = {
          config = {
            border = "rounded",
          },
        },
      })

      vim.notify = notify.make_notify({
        ERROR = { duration = 5000 },
        WARN = { duration = 4000 },
        INFO = { duration = 3000 },
      })

      -- Clue
      local miniclue = require("mini.clue")
      miniclue.setup({
        triggers = {
          -- Leader triggers
          { mode = "n", keys = "<Leader>" },
          { mode = "x", keys = "<Leader>" },

          -- Built-in completion
          { mode = "i", keys = "<C-x>" },

          -- `g` key
          { mode = "n", keys = "g" },
          { mode = "x", keys = "g" },

          -- Marks
          { mode = "n", keys = "'" },
          { mode = "n", keys = "`" },
          { mode = "x", keys = "'" },
          { mode = "x", keys = "`" },

          -- Registers
          { mode = "n", keys = '"' },
          { mode = "x", keys = '"' },
          { mode = "i", keys = "<C-r>" },
          { mode = "c", keys = "<C-r>" },

          -- Window commands
          { mode = "n", keys = "<C-w>" },

          -- `z` key
          { mode = "n", keys = "z" },
          { mode = "x", keys = "z" },
        },

        clues = {
          -- Enhance this by adding descriptions for <Leader> mapping groups
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows(),
          miniclue.gen_clues.z(),
        },
      })
    end,
  },
}
