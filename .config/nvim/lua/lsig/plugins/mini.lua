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
      local notify = require("mini.notify")
      notify.setup({
        window = { config = { border = "double" } },
      })
      vim.notify = notify.make_notify({
        ERROR = { duration = 5000 },
        WARN = { duration = 4000 },
        INFO = { duration = 3000 },
      })
    end,
  },
}
