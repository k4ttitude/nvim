return {
  "greggh/claude-code.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for git operations
  },
  lazy = false,
  config = function()
    require("claude-code").setup({
      window = {
        split_ratio = 0.4,
        position = "float",
      },
    })
  end,
}
