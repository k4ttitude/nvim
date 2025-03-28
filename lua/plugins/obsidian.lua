return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  event = "VeryLazy",
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "/Users/kattitude/Library/Mobile Documents/iCloud~md~obsidian/Documents/Root",
      },
    },
  },
  keys = {
    { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Obsidian Search" },
    { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "Obsidian New" },
    { "<leader>o<tab>", ":Obsidian", desc = "Obsidian..." },
  },
}
