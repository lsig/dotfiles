return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({})

    local ts_group = vim.api.nvim_create_augroup("TelescopeOnEnter", { clear = true })
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
-- return {
--   {
--     "nvim-telescope/telescope.nvim",
--     version = "*",
--     dependencies = { { "nvim-lua/plenary.nvim" } },
--     config = function()
--       local actions = require("telescope.actions")
--       require("telescope").setup({
--         defaults = {
--           file_ignore_patterns = {
--             "node_modules",
--             ".git",
--             "dist",
--             "yarn.lock",
--             "profile_list_images",
--             "target",
--           },
--           sorting_strategy = "ascending",
--           multi_icon = "",
--           layout_strategy = "flex",
--           winblend = 0,
--           layout_config = {
--             horizontal = {
--               prompt_position = "top",
--               preview_width = 0.5,
--             },
--             vertical = {
--               mirror = true,
--             },
--             center = {
--               mirror = true,
--             },
--           },
--           hl_result_eol = false,
--           preview = {
--             msg_bg_fillchar = " ",
--           },
--           history = {
--             cycle_wrap = true,
--           },
--           cache = false,
--           dynamic_preview_title = true,
--           mappings = {
--             i = {
--               ["<C-w>"] = "which_key",
--             },
--           },
--         },
--         pickers = {
--           find_files = {
--             previewer = true,
--             mappings = {
--               i = {
--                 ["<esc>"] = actions.close,
--               },
--             },
--           },
--           buffers = {
--             theme = "dropdown",
--             previewer = false,
--             mappings = {
--               i = {
--                 ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
--                 ["<esc>"] = actions.close,
--               },
--             },
--             sort_mru = true,
--           },
--           resume = {
--             theme = "dropdown",
--             previewer = false,
--           },
--           current_buffer_fuzzy_find = {
--             theme = "dropdown",
--             previewer = false,
--             mappings = {
--               i = {
--                 ["<esc>"] = actions.close,
--                 ["<CR>"] = function(prompt_bufnr)
--                   actions.select_default(prompt_bufnr)
--                   vim.cmd("normal! zz")
--                 end,
--               },
--             },
--           },
--           git_files = {
--             theme = "dropdown",
--             previewer = false,
--             show_untracked = true,
--             mappings = {
--               i = {
--                 ["<esc>"] = actions.close,
--               },
--             },
--           },
--         },
--         extensions = {
--           fzf = {
--             fuzzy = true, -- false will only do exact matching
--             override_generic_sorter = true, -- override the generic sorter
--             override_file_sorter = true, -- override the file sorter
--             case_mode = "smart_case", -- or "ignore_case" or "respect_case"
--             -- the default case_mode is "smart_case"
--           },
--           ["ui-select"] = {
--             require("telescope.themes").get_cursor({}),
--           },
--         },
--       })
--
--       -- Open Telescope on startup if the first argument is a directory
--       local ts_group = vim.api.nvim_create_augroup("TelescopeOnEnter", { clear = true })
--       vim.api.nvim_create_autocmd({ "VimEnter" }, {
--         callback = function()
--           local first_arg = vim.v.argv[3]
--           if first_arg and vim.fn.isdirectory(first_arg) == 1 then
--             -- Vim creates a buffer for folder. Close it.
--             vim.cmd(":bd 1")
--             require("telescope.builtin").find_files({ search_dirs = { first_arg } })
--           end
--         end,
--         group = ts_group,
--       })
--
--       require("telescope").load_extension("fzf")
--       require("telescope").load_extension("ui-select")
--     end,
--   },
--   {
--     "nvim-telescope/telescope-ui-select.nvim",
--     dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
--   },
--   {
--     "nvim-telescope/telescope-fzf-native.nvim",
--     build = "make",
--     cond = function()
--       return vim.fn.executable("make") == 1
--     end,
--   },
-- }
