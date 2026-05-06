return {
  "nvim-neo-tree/neo-tree.nvim",
  lazy = false,
  opts = {
    window = {
      position = "right",
    },
    filesystem = {
      follow_current_file = { enabled = false },
    },
  },
  keys = {
    { "<leader>E", "<cmd>Neotree reveal<cr>", desc = "Reveal in NeoTree" },
  },
}
