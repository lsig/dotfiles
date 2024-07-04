return {
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require("mini.ai").setup()
      require("mini.pairs").setup({
        modes = { insert = true, command = true, terminal = true },
      })
      require("mini.extra").setup()
      require("mini.comment").setup()
      require("mini.surround").setup()
      require("mini.bracketed").setup()
      require("mini.bufremove").setup()
      require("mini.cursorword").setup()
      require("mini.trailspace").setup()

      -- Icons
      require("mini.icons").setup()
      MiniIcons.mock_nvim_web_devicons()

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

      -- Hop config
      require("mini.jump2d").setup({
        view = { dim = true },
        mappings = {
          start_jumping = ";",
        },
      })

      -- Hipattern setup
      local hipatterns = require("mini.hipatterns")
      local hi_words = MiniExtra.gen_highlighter.words
      hipatterns.setup({
        highlighters = {
          fixme = hi_words({ "FIXME", "Fixme", "fixme" }, "MiniHipatternsFixme"),
          hack = hi_words({ "HACK", "Hack", "hack" }, "MiniHipatternsHack"),
          todo = hi_words({ "TODO", "Todo", "todo" }, "MiniHipatternsTodo"),
          note = hi_words({ "NOTE", "Note", "note" }, "MiniHipatternsNote"),

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
      local custom_clues = {
        { mode = "n", keys = "<Leader>b", desc = "+Buffers" },
        { mode = "n", keys = "<Leader>g", desc = "+Git" },
        { mode = "n", keys = "<Leader>l", desc = "+Grep" },
        { mode = "n", keys = "<Leader>s", desc = "+Splits" },
        { mode = "n", keys = "<Leader>t", desc = "+Tabs" },
        { mode = "n", keys = "<Leader>w", desc = "+Workspace" },
        { mode = "n", keys = "<Leader>/", desc = "+FZF" },
      }

      local miniclue = require("mini.clue")
      miniclue.setup({
        triggers = {
          -- Leader triggers
          { mode = "n", keys = "<Leader>" },
          { mode = "x", keys = "<Leader>" },

          -- mini.basics
          { mode = "n", keys = [[\]] },

          -- mini.bracketed
          { mode = "n", keys = "[" },
          { mode = "n", keys = "]" },
          { mode = "x", keys = "[" },
          { mode = "x", keys = "]" },

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
          custom_clues,
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows({ submode_resize = true }),
          miniclue.gen_clues.z(),
        },
        window = { config = { border = "double" } },
      })
    end,
  },
}
