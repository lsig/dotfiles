return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    {
      "<leader><space>",
      function()
        require("fzf-lua").buffers()
      end,
      desc = "Search commands",
    },
    {
      "<leader>lg",
      function()
        require("fzf-lua").live_grep()
      end,
      desc = "Search command history",
    },
    {
      "<leader>/",
      function()
        require("fzf-lua").lgrep_curbuf()
      end,
      desc = "Search command history",
    },
    {
      "<C-t>",
      function()
        require("fzf-lua").files()
      end,
      desc = "Find files",
    },
    {
      "<leader>ch",
      function()
        require("fzf-lua").command_history()
      end,
      desc = "Find files",
    },
    {
      "<leader>sg",
      function()
        require("fzf-lua").git_files()
      end,
      desc = "Find git files",
    },
    {
      "<leader>/gb",
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
      "<leader>//",
      function()
        require("fzf-lua").resume()
      end,
      desc = "Resume FZF",
    },
    {
      "<leader>gs",
      function()
        require("fzf-lua").git_status()
      end,
      desc = "Show git status",
    },
  },
  config = function()
    -- calling `setup` is optional for customization
    local fzf = require("fzf-lua")
    local actions = require("fzf-lua.actions")
    fzf.setup({
      defaults = { formatter = { "path.filename_first" } },
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
    })
    fzf.register_ui_select(function(_, items)
      local min_h, max_h = 0.15, 0.70
      local h = (#items + 4) / vim.o.lines
      if h < min_h then
        h = min_h
      elseif h > max_h then
        h = max_h
      end
      return { winopts = { height = h, width = 0.60, row = 0.40 } }
    end)

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
