local harpoon = require("harpoon")

local function toggle_fzf(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("fzf-lua").fzf_exec(file_paths, {
    prompt = "Harpoon> ",
    winopts = { height = 0.4, width = 0.4 },
    actions = {
      ["default"] = function(selected)
        vim.cmd("edit " .. selected[1])
      end,
    },
  })
end

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<C-e>",
      function()
        toggle_fzf(harpoon:list())
      end,
      { desc = "Open harpoon window" },
    },
  },
}
