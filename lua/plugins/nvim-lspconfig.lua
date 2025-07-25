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
            -- sdk = "$NVM_DIR/versions/node/v22.15.0/lib/node_modules/@typescript/native-preview-darwin-arm64/lib",
            -- experimental = { useTsgo = true },
          },
          -- vtsls = {
          --   autoUseWorkspaceTsdk = true,
          -- },
        },
        on_attach = function(client, bufnr)
          vim.defer_fn(function()
            local settings = client.config.settings or {}
            local ts_settings = settings.typescript or {}
            local sdk = ts_settings.sdk
            local node_options = client.config.cmd_env and client.config.cmd_env.NODE_OPTIONS or "not set"
            -- print("TypeScript SDK: " .. (sdk or "default/system"))
            -- print("    └─ NODE_OPTIONS: " .. node_options)
            print("TypeScript SDK: " .. (sdk or "default/system") .. "\n  └─ NODE_OPTIONS: " .. node_options)
          end, 2000)
        end,
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
