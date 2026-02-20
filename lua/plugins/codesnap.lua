return {
  "mistricky/codesnap.nvim",
  build = "make",
  version = "v1.6.3",
  keys = {
    { "<leader>cs", "<Esc><cmd>CodeSnap<cr>", mode = "x", desc = "Snapshot and copy into clipboard" },
  },
  opts = {
    mac_window_bar = false,
    watermark = "",
    has_line_number = true,
    has_breadcrumbs = true,
    bg_padding = 0,
  },
}
