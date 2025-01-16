return {
  "folke/snacks.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    bigfile = { enabled = true },
    notifier = { enabled = true },
    lazygit = { enabled = true },
    dim = { enabled = true },
    gitbrowse = { enabled = true },
    terminal = { enabled = true },
    input = { enabled = true },
    picker = {
      formatters = {
        file = {
          filename_first = true,
        },
      },
      previewers = {
        git = {
          native = true,
        },
      },
      win = {
        input = {
          keys = {
            ["<Esc>"] = { "close", mode = { "n", "i" } },
          },
        },
      },
      sources = {
        diagnostics = {
          layout = {
            reverse = false,
            preset = "ivy",
          },
        },
        git_status = {
          win = {
            input = {
              keys = {
                ["<C-s>"] = { "git_stage", mode = { "n", "i" } },
              },
            },
          },
        },
        grep = {
          ignored = false,
        },
        recent = {
          layout = {
            reverse = false,
            preset = "vscode",
          },
          filter = {
            cwd = true,
          },
        },
      },
    },
  },
  keys = {
    {
      "<C-\\>",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Search buffers",
    },
    {
      "<C-f>",
      function()
        Snacks.picker.grep({ live = true })
      end,
      desc = "Live grep",
    },
    {
      "<C-p>",
      function()
        Snacks.picker.files()
      end,
      desc = "Find files",
    },
    {
      "<C-e>",
      function()
        Snacks.picker.recent()
      end,
      desc = "Find files",
    },
    {
      "<C-_>",
      function()
        Snacks.picker.lines()
      end,
      desc = "Grep current buffer",
    },
    {
      "<C-g>",
      function()
        Snacks.picker.git_status()
      end,
      desc = "Grep current buffer",
    },
    {
      "<leader>lw",
      function()
        Snacks.picker.grep_word()
      end,
      desc = "Search for word under cursor",
    },
    { "<leader>gs", ":lua Snacks.lazygit()<CR>", desc = "[G]it [S]tatus" },
    {
      "gd",
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = "Goto Definition",
    },
    {
      "gr",
      function()
        Snacks.picker.lsp_references()
      end,
      nowait = true,
      desc = "References",
    },
    {
      "gI",
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = "Goto Implementation",
    },
    {
      "<leader>D",
      function()
        Snacks.picker.lsp_type_definitions()
      end,
      desc = "Goto T[y]pe Definition",
    },
    {
      "<leader>ss",
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = "LSP Symbols",
    },
    {
      "<leader>Q",
      function()
        Snacks.picker.diagnostics()
      end,
      desc = "LSP Diagnostics",
    },
  },
  -- Auto-start files picker when opening a directory
  init = function()
    vim.api.nvim_create_autocmd({ "VimEnter" }, {
      callback = function()
        local first_arg = vim.v.argv[3]
        if first_arg and vim.fn.isdirectory(first_arg) == 1 then
          vim.cmd(":bd 1")
          Snacks.picker.files({ cwd = first_arg })
        end
      end,
    })
  end,
}
