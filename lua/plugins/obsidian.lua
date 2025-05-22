if vim.loop.os_uname().sysname == "Darwin" then
  return {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    ---@module 'obsidian'
    ---@type obsidian.config.ClientOpts
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "/Users/kattitude/Library/Mobile Documents/iCloud~md~obsidian/Documents/Root",
        },
      },

      templates = {
        folder = "99 - assets/templates",
      },

      daily_notes = {
        folder = "00 - Daily",
        default_tags = { "daily-notes" },
        -- template = "daily",
      },

      completion = {
        nvim_cmp = false,
        blink = true,
        min_chars = 2,
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
else
  return {}
end
