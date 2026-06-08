-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

map("n", "<c-u>", "<c-u>zz")
map("n", "<c-d>", "<c-d>zz")

map("n", "<leader>by", function()
  local abs_path = vim.fn.expand("%:p")
  -- let git resolve the outermost working tree (handles submodules);
  -- fall back to LazyVim's root (lsp/cwd) when not in a git repo
  local out = vim.fn.systemlist({
    "git", "-C", vim.fn.expand("%:p:h"),
    "rev-parse", "--show-superproject-working-tree", "--show-toplevel",
  })
  local root = vim.v.shell_error == 0 and out[1] or LazyVim.root()
  local rel_path = vim.fs.relpath(root, abs_path) or vim.fn.fnamemodify(abs_path, ":.")
  vim.fn.setreg("+", rel_path)
  vim.notify("Copied: " .. rel_path, vim.log.levels.INFO)
end, { desc = "Copy Buffer path" })
