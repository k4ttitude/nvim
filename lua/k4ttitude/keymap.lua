vim.g.mapleader = " "

-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Moving line
vim.keymap.set("v", "J", ":m .+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m .-2<CR>gv=gv")

--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

vim.keymap.set("n", "+", ":vertical res +1<CR>")
vim.keymap.set("n", "-", ":vertical res -1<CR>")

vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")
