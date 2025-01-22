return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    delay = 800,
    spec = {
      { "<leader>d", name = "+Dim" },
      { "<leader>s", name = "+Splits" },
      { "<leader>t", name = "+Tabs" },
      { "<leader>b", name = "+Buffers" },
      { "<leader>g", name = "+Git" },
      { "<leader>l", name = "+Search" },
      { "<leader>w", name = "+Workspace" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
