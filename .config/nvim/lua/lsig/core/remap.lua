-- normal mode remaps
vim.keymap.set("n", "<leader>pv", ":Oil<CR>", { silent = true })

-- window remaps
vim.keymap.set("n", "<leader>cd", ":cd %:p:h", { silent = true })
vim.keymap.set("n", "<leader>sv", "<C-w>v")
vim.keymap.set("n", "<leader>sl", "<C-w>s")
vim.keymap.set("n", "<leader>se", "<C-w>=")
vim.keymap.set("n", "<leader>s-", ":vertical resize -5<CR>", { silent = true })
vim.keymap.set("n", "<leader>s+", ":vertical resize +5<CR>", { silent = true })
vim.keymap.set("n", "<leader>sx", ":close<CR>", { silent = true })

-- tab remaps
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", { silent = true })
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", { silent = true })
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", { silent = true })
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", { silent = true })

-- buffer remaps
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { silent = true })
vim.keymap.set("n", "<leader>bx", ":bdelete<CR>", { silent = true })

-- loclist remaps
vim.keymap.set("n", "<leader>j", ":lnext<CR>zz", { silent = true })
vim.keymap.set("n", "<leader>k", ":lprev<CR>zz", { silent = true })

-- Git remaps
vim.keymap.set("n", "]c", require("gitsigns").prev_hunk, { desc = "[G]o to [P]revious Hunk" })
vim.keymap.set("n", "[c", require("gitsigns").next_hunk, { desc = "[G]o to [N]ext Hunk" })
vim.keymap.set("n", "<leader>ht", require("gitsigns").preview_hunk_inline, { desc = "[H]unk [T]oggle" })
vim.keymap.set("n", "<leader>hs", require("gitsigns").stage_hunk, { desc = "[H]unk [S]tage" })
vim.keymap.set("n", "<leader>hr", require("gitsigns").reset_hunk, { desc = "[H]unk [R]eset" })
vim.keymap.set("n", "<leader>B", require("gitsigns").toggle_current_line_blame, { desc = "[G]it [B]lame" })
vim.keymap.set("n", "<leader>gc", ":Git commit<CR>")
vim.keymap.set("n", "<leader>p", ":Git pull<CR>")
vim.keymap.set("n", "<leader>P", ":Git push<CR>")

-- remaps
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<BS>", "ciw")
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set("n", "Q", "<nop>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- insert mode remaps
vim.keymap.set("i", "<C-c>", "<ESC>")

-- visual mode remaps
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
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
