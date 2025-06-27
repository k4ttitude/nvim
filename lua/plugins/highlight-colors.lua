return {
  {
    "brenoprata10/nvim-highlight-colors",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      render = "virtual",
      virtual_symbol = "■",
      virtual_symbol_prefix = " ",
      virtual_symbol_suffix = "",
      virtual_symbol_position = "eow",

      -- Highlight named colors, like 'green'
      enable_named_colors = true,

      -- Highlight tailwind colors, like 'bg-blue-500'
      enable_tailwind = false,

      -- Exclude filetypes or buftypes from highlighting
      exclude_filetypes = {},
      exclude_buftypes = {},
    },
  },

  {
    "saghen/blink.cmp",
    optional = true,
    dependencies = { "brenoprata10/nvim-highlight-colors" },
    opts = {
      completion = {
        menu = {
          draw = {
            components = {
              -- customize the drawing of kind icons
              kind_icon = {
                text = function(ctx)
                  -- default kind icon
                  local icon = ctx.kind_icon
                  -- if LSP source, check for color derived from documentation
                  if ctx.item.source_name == "LSP" then
                    local color_item =
                      require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
                    if color_item and color_item.abbr ~= "" then
                      icon = color_item.abbr
                    end
                  end
                  return icon .. ctx.icon_gap
                end,
                highlight = function(ctx)
                  -- default highlight group
                  local highlight = "BlinkCmpKind" .. ctx.kind
                  -- if LSP source, check for color derived from documentation
                  if ctx.item.source_name == "LSP" then
                    local color_item =
                      require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
                    if color_item and color_item.abbr_hl_group then
                      highlight = color_item.abbr_hl_group
                    end
                  end
                  return highlight
                end,
              },
            },
          },
        },
      },
    },
  },
}
