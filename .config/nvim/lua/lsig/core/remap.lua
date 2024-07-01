-- normal mode remaps
vim.keymap.set("n", "<leader>pv", ":Oil<CR>", { silent = true, desc = "Open Oil" })

-- window remaps
vim.keymap.set("n", "<leader>cd", ":cd %:p:h", { silent = true, desc = "Change directory to file" })
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
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { silent = true, desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { silent = true, desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bx", ":lua MiniBufremove.delete() <CR>", { silent = true, desc = "Delete buffer" })

-- loclist remaps
vim.keymap.set("n", "<leader>j", ":lnext<CR>zz", { silent = true, desc = "Next location" })
vim.keymap.set("n", "<leader>k", ":lprev<CR>zz", { silent = true, desc = "Previous location" })

-- Git remaps
vim.keymap.set("n", "<leader>to", "<Cmd>lua require('mini.diff').toggle_overlay()<CR>", { desc = "[T]oggle [O]verlay" })
vim.keymap.set("n", "<leader>P", ":Git push<CR>", { silent = true, desc = "Git push" })
vim.keymap.set("n", "<leader>p", ":Git pull<CR>", { silent = true, desc = "Git pull" })
vim.keymap.set("n", "<leader>gc", "<Cmd>Git commit<CR>", { silent = true, desc = "Commit" })
vim.keymap.set("n", "<leader>gC", "<Cmd>Git commit --amend<CR>", { silent = true, desc = "Commit amend" })
vim.keymap.set("n", "gl", "<Cmd>Git log --oneline<CR>", { silent = true, desc = "log" })
vim.keymap.set("n", "gL", "<Cmd>Git log --oneline --follow -- %<CR>", { silent = true, desc = "Log buffer" })
vim.keymap.set("n", "gs", "<Cmd>lua MiniGit.show_at_cursor()<CR>", { silent = true, desc = "Show at cursor" })
vim.keymap.set("x", "gs", "<Cmd>lua MiniGit.show_at_cursor()<CR>", { silent = true, desc = "Show at selection" })

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
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
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

-- highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})
