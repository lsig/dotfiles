return {
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require("mini.jump2d").setup({
        view = { dim = true },
        mappings = {
          start_jumping = ";",
        },
      })
      require("mini.pairs").setup()
      require("mini.surround").setup()
      require("mini.git").setup()
      require("mini.ai").setup()

      -- Hipattern setup
      local hipatterns = require("mini.hipatterns")
      hipatterns.setup({
        highlighters = {
          -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE', 'WARN'
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
      notify.setup()
      vim.notify = notify.make_notify({
        ERROR = { duration = 5000 },
        WARN = { duration = 4000 },
        INFO = { duration = 3000 },
      })
    end,
  },
}
