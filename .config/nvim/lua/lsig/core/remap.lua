-- normal mode remaps
vim.keymap.set("n", "-", ":Oil<CR>", { silent = true, desc = "Open Oil" })
vim.keymap.set("n", "<leader>ds", "<Cmd>lua Snacks.dim.enable()<CR>", { silent = true, desc = "Dim scope" })
vim.keymap.set("n", "<leader>dS", "<Cmd>lua Snacks.dim.disable()<CR>", { silent = true, desc = "Disable dim scope" })

-- window remaps
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sl", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equalize window sizes" })
vim.keymap.set("n", "<leader>s-", ":vertical resize -5<CR>", { silent = true, desc = "Decrease vertical size" })
vim.keymap.set("n", "<leader>s+", ":vertical resize +5<CR>", { silent = true, desc = "Increase vertical size" })
vim.keymap.set("n", "<leader>sx", ":close<CR>", { silent = true, desc = "Close window" })

-- tab remaps
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", { silent = true, desc = "Open new tab" })
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", { silent = true, desc = "Close current tab" })
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", { silent = true, desc = "Go to next tab" })
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", { silent = true, desc = "Go to previous tab" })

-- buffer remaps
vim.keymap.set("n", "<leader>bx", ":lua MiniBufremove.delete() <CR>", { silent = true, desc = "Delete buffer" })

-- Git remaps
vim.keymap.set("n", "<leader>go", "<Cmd>lua require('mini.diff').toggle_overlay()<CR>", { desc = "[T]oggle [O]verlay" })
vim.keymap.set("n", "<leader>gP", ":Git push<CR>", { silent = true, desc = "Git push" })
vim.keymap.set("n", "<leader>gp", ":Git pull<CR>", { silent = true, desc = "Git pull" })
vim.keymap.set("n", "<leader>gc", "<Cmd>Git commit<CR>", { silent = true, desc = "Commit" })
vim.keymap.set("n", "<leader>gC", "<Cmd>Git commit --amend<CR>", { silent = true, desc = "Commit amend" })
vim.keymap.set("n", "<leader>gl", "<Cmd>lua Snacks.lazygit.log_file()<CR>", { silent = true, desc = "log" })
vim.keymap.set("n", "<leader>gL", "<Cmd>lua Snacks.picker.git_log_line()<CR>", { silent = true, desc = "Log buffer" })
vim.keymap.set("n", "<leader>gS", "<Cmd>lua MiniGit.show_at_cursor()<CR>", { silent = true, desc = "Show at cursor" })

-- remaps
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<BS>", "ciw")
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })
vim.keymap.set("n", "Q", "<nop>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Undotree
vim.keymap.set("n", "<leader>U", ":UndotreeToggle<CR>", { silent = true, desc = "Toggle undotree" })

-- insert mode remaps
vim.keymap.set("i", "<C-c>", "<ESC>")

-- visual mode remaps
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- x mode remaps
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Terminal
vim.keymap.set("n", "<leader>tt", function()
  Snacks.terminal.toggle(vim.o.shell, {
    win = {
      width = 0.6,
      height = 0.6,
      relative = "editor",
      border = "rounded",
      title = "Terminal",
      title_pos = "center",
    },
    toggle = true,
    cwd = vim.fn.expand("%:p:h"),
  })
end, { desc = "Open floating terminal" })
