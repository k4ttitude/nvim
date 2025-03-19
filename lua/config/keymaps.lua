-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

map("n", "<c-u>", "<c-u>zz")
map("n", "<c-d>", "<c-d>zz")

map("n", "<leader>bq", "<cmd>:%bd<cr>", { desc = "Delete all buffers" })
map("n", "<leader>bw", "<cmd>:%bd|e#<cr>", { desc = "Delete all buffers (but current)" })
