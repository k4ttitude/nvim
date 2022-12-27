local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver', 'eslint'
})
lsp.setup()

vim.keymap.set('n', '<leader>fa', [[mF:%!eslint_d --stdin --fix-to-stdout --stdin-filename %<CR>`F]])
vim.keymap.set('v', '<leader>fa', ':!eslint_d --stdin --fix-to-stdout<CR>gv')
