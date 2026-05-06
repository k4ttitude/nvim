return {
  {
    url = "https://codeberg.org/andyg/leap.nvim.git",
    keys = {
      { "s", mode = { "n", "x", "o" }, desc = "Leap" },
      { "S", mode = { "n", "x", "o" }, desc = "Leap from Window" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap Anywhere" },
    },
    config = function(_, opts)
      local leap = require("leap")
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap)")
      vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-from-window)")
      vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-anywhere)")
    end,
  },
}
