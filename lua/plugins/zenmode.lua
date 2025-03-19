return {
  "folke/zen-mode.nvim",
  opts = {
    window = { width = 180 },
    plugins = {
      tmux = { enabled = true },
    },
  },
  keys = {
    { "<leader>uz", "<cmd>ZenMode<cr>", desc = "Toggle ZenMode" },
  },
}
