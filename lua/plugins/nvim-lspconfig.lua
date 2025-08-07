return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    servers = {
      eslint = {},
      vtsls = {
        cmd = { "vtsls", "--stdio", "--logLevel=verbose" },
        cmd_env = {
          NODE_OPTIONS = "--max-old-space-size=8192",
        },
        settings = {
          typescript = {
            preferences = {
              includePackageJsonAutoImports = "off", -- reduce infitial scan
            },
          },
        },
      },
    },
    setup = {
      eslint = function()
        require("lazyvim.util").lsp.on_attach(function(client)
          if client.name == "eslint" then
            client.server_capabilities.documentFormattingProvider = true
          elseif client.name == "vtsls" then
            client.server_capabilities.documentFormattingProvider = false
          end
        end)
      end,
    },
  },
}
