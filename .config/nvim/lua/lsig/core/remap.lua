-- window remaps
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sl", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equalize window sizes" })
vim.keymap.set("n", "<leader>s-", ":vertical resize -5<CR>", { silent = true, desc = "Decrease vertical size" })
vim.keymap.set("n", "<leader>s+", ":vertical resize +5<CR>", { silent = true, desc = "Increase vertical size" })
vim.keymap.set("n", "<leader>sx", ":close<CR>", { silent = true, desc = "Close window" })

-- Git remaps
vim.keymap.set("n", "<leader>go", "<Cmd>lua require('mini.diff').toggle_overlay()<CR>", { desc = "[T]oggle [O]verlay" })
vim.keymap.set("n", "<leader>gl", "<Cmd>lua Snacks.lazygit.log_file()<CR>", { silent = true, desc = "log" })
vim.keymap.set("n", "<leader>gL", "<Cmd>lua Snacks.picker.git_log_line()<CR>", { silent = true, desc = "Log buffer" })

-- remaps
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<BS>", "ciw")
vim.keymap.set("n", "gV", "`[v`]")
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("x", "<C-_>", "<Cmd>lua Snacks.picker.lines()<CR>", { silent = true, desc = "Show at cursor" })

-- Undotree
vim.keymap.set("n", "<leader>U", "<Cmd>lua Snacks.picker.undo()<CR>", { silent = true, desc = "Toggle undotree" })

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
