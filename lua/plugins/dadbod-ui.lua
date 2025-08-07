return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true }, -- Optional
    { "saghen/blink.cmp" },
  },
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
    local blink = require("blink.cmp")

    local source_id = "dadbod"
    blink.add_source_provider(source_id, {
      name = "Dadbod",
      module = "vim_dadbod_completion.blink",
      score_offset = 85,
    })
    blink.add_filetype_source("sql", source_id)
  end,
  keys = {
    { "<leader>D", "", desc = "+DBUI" },
    { "<leader>Ds", "<Plug>(DBUI_SaveQuery)", desc = "Obsidian Search", ft = "sql" },
  },
}
