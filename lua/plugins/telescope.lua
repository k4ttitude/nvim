-- keymaps
local builtin = require("telescope.builtin")

return {
  "nvim-telescope/telescope.nvim",
  optional = true,
  opts = function(_, opts)
    if not require("lazyvim.util").has("flash.nvim") then
      return
    end
    local function flash(prompt_bufnr)
      require("flash").jump({
        pattern = "^",
        label = { after = { 0, 0 } },
        search = {
          mode = "search",
          exclude = {
            function(win)
              return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults"
            end,
          },
        },
        action = function(match)
          local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
          picker:set_selection(match.pos[1] - 1)
        end,
      })
    end
    opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
      mappings = { n = { s = flash }, i = { ["<c-s>"] = flash } },
    })
  end,
  keys = {
    {
      "<leader><leader>",
      LazyVim.pick("find_files", { hidden = true, no_ignore = true }),
      desc = "Find files (root dir)",
    },
    { "<leader>fF", LazyVim.pick("files"), desc = "Find Files (root dir)" },
    { "<leader>ff", LazyVim.pick("files", { cwd = false }), desc = "Find Files (cwd)" },
    { "<leader>fR", builtin.lsp_references, desc = "Recent finds" },
    { "<leader>fr", LazyVim.pick("oldfiles", { cwd = vim.loop.cwd() }), desc = "Recent finds (cwd)" },
    { "<leader>sG", LazyVim.pick("live_grep"), desc = "Grep (root dir)" },
    { "<leader>sg", LazyVim.pick("live_grep", { cwd = false }), desc = "Grep (cwd)" },
  },
}
