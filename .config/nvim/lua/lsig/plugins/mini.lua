return {
  {
    "echasnovski/mini.nvim",
    version = false,
    event = "BufReadPost",
    config = function()
      require("mini.jump2d").setup({
        mappings = {
          start_jumping = ";",
        },
      })
      require("mini.pairs").setup()
      require("mini.surround").setup()
      require("mini.git").setup()
    end,
  },
}