return {
  "ibhagwan/fzf-lua",
  dependencies = { "echasnovski/mini.nvim" },
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
      previewers = {
        builtin = {
          syntax_limit_b = 1024 * 100, -- 100KB
          extensions = {
            ["jpg"] = { "viu", "-b" },
            ["jpeg"] = { "viu", "-b" },
            ["png"] = { "viu", "-b" },
            ["gif"] = { "viu", "-b" },
            ["ico"] = { "viu", "-b" },
            ["webp"] = { "viu", "-b" },
          },
        },
      },
      grep = {
        rg_glob = true, -- enable glob parsing
        glob_flag = "--iglob", -- case insensitive globs
        glob_separator = "%s%-%-", -- query separator pattern (lua): ' --'
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
