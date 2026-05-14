-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.winbar = "%=%m %f"
vim.g.lazyvim_prettier_needs_config = true

-- Folds
vim.o.foldenable = true
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldtext = ""
vim.o.foldlevelstart = 99
vim.opt.fillchars = {
  fold = " ",
  foldopen = "▾",
  foldclose = "▸",
  foldinner = " ",
  foldsep = " ",
}
