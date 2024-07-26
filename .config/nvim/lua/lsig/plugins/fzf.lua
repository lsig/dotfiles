return {
  "ibhagwan/fzf-lua",
  keys = {
    {
      "<C-\\>",
      function()
        require("fzf-lua").buffers()
      end,
      desc = "Search commands",
    },
    {
      "<C-l>",
      function()
        require("fzf-lua").live_grep()
      end,
      desc = "Live grep",
    },
    {
      "<leader>lb",
      function()
        require("fzf-lua").lgrep_curbuf()
      end,
      desc = "Grep current buffer",
    },
    {
      "<C-p>",
      function()
        require("fzf-lua").files()
      end,
      desc = "Find files",
    },
    {
      "<leader>lh",
      function()
        require("fzf-lua").command_history()
      end,
      desc = "Command history",
    },
    {
      "<leader>gf",
      function()
        require("fzf-lua").git_files()
      end,
      desc = "Find git files",
    },
    {
      "<leader>gb",
      function()
        require("fzf-lua").git_branches()
      end,
      desc = "Search git branches",
    },
    {
      "<leader>/gc",
      function()
        require("fzf-lua").git_commits()
      end,
      desc = "Search git commits",
    },
    {
      "<leader>/gC",
      function()
        require("fzf-lua").git_bcommits()
      end,
      desc = "Search git buffer commits",
    },
    {
      "<leader>/r",
      function()
        require("fzf-lua").resume()
      end,
      desc = "Resume FZF",
    },
    {
      "<C-g>",
      function()
        require("fzf-lua").git_status()
      end,
      desc = "Show git status",
    },
    {
      "<leader>lw",
      function()
        require("fzf-lua").grep_cword()
      end,
      desc = "Search for word under cursor",
    },
  },
  config = function()
    -- calling `setup` is optional for customization
    local fzf = require("fzf-lua")
    local actions = require("fzf-lua.actions")
    fzf.setup({
      defaults = {
        formatter = { "path.filename_first" },
        defaults = { file_icons = "mini" },
      },
      keymap = {
        fzf = {
          ["CTRL-Q"] = "select-all+accept",
        },
        builtin = {
          ["<C-f>"] = "preview-down",
          ["<C-b>"] = "preview-up",
        },
      },
      git = {
        status = {
          actions = {
            -- actions inherit from 'actions.files' and merge
            ["right"] = false,
            ["left"] = false,
            ["ctrl-l"] = { fn = actions.git_unstage, reload = true },
            ["ctrl-h"] = { fn = actions.git_stage, reload = true },
            ["ctrl-x"] = { fn = actions.git_reset, reload = true },
            ["ctrl-s"] = { fn = actions.git_stage_unstage, reload = true },
          },
        },
      },
      lsp = {
        code_actions = {
          prompt = "Code actions",
          winopts = {
            width = 0.8,
            height = 0.7,
            preview = {
              layout = "horizontal",
              horizontal = "up:75%",
            },
          },
        },
      },
    })
    fzf.register_ui_select()

    local ts_group = vim.api.nvim_create_augroup("FzfLuaOnEnter", { clear = true })
    vim.api.nvim_create_autocmd({ "VimEnter" }, {
      callback = function()
        local first_arg = vim.v.argv[3]
        if first_arg and vim.fn.isdirectory(first_arg) == 1 then
          -- Vim creates a buffer for folder. Close it.
          vim.cmd(":bd 1")
          require("fzf-lua").files({ cwd = first_arg })
        end
      end,
      group = ts_group,
    })
  end,
}
