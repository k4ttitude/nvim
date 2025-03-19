local harpoon = require("harpoon")

local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers")
    .new({}, {
      prompt_title = "Harpoon",
      finder = require("telescope.finders").new_table({
        results = file_paths,
      }),
      previewer = conf.file_previewer({}),
      sorter = conf.generic_sorter({}),
    })
    :find()
end

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<C-S-P>",
      function()
        harpoon:list():prev()
      end,
      desc = "Harpoon prev",
    },
    {
      "<C-S-N>",
      function()
        harpoon:list():next()
      end,
      desc = "Harpoon next",
    },
    {
      "<C-e>",
      function()
        toggle_telescope(harpoon:list())
      end,
      { desc = "Open harpoon window" },
    },
  },
}
