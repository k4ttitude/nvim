if vim.loop.os_uname().sysname == "Darwin" then
  return {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    event = "VeryLazy",
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      disable_frontmatter = true,
      ui = { enable = false },
      workspaces = {
        {
          name = "personal",
          path = "/Users/kattitude/Library/Mobile Documents/iCloud~md~obsidian/Documents/Root",
        },
      },
    },
    keys = {
      { "<leader>o", "", desc = "+Obsidian" },
      { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Obsidian Search" },
      { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "Obsidian New" },
      { "<leader>ot", "<cmd>ObsidianToday<cr>", desc = "Obsidian Today" },
      { "<leader>o<tab>", ":Obsidian", desc = "Obsidian..." },
    },
  }
end
