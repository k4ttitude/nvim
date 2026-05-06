-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_user_command("PrettierConfigShow", function()
  if vim.fn.executable("npx") ~= 1 and vim.fn.executable("prettier") ~= 1 then
    vim.notify("prettier not found in PATH", vim.log.levels.ERROR)
    return
  end

  local filepath = vim.api.nvim_buf_get_name(0)
  if filepath == "" then
    vim.notify("No file associated with current buffer", vim.log.levels.ERROR)
    return
  end

  local prettier_cmd = vim.fn.executable("prettier") == 1 and "prettier" or "npx prettier"
  local escaped_file = vim.fn.shellescape(filepath)

  -- Find config path
  local config_path = vim.fn.system({ "sh", "-c", prettier_cmd .. " --find-config-path " .. escaped_file })
  config_path = vim.trim(config_path)

  if vim.v.shell_error ~= 0 or config_path == "" then
    vim.notify("No Prettier configuration found", vim.log.levels.WARN)
    return
  end

  -- Read config file content directly
  local config_content = vim.fn.readfile(config_path)
  if not config_content then
    vim.notify("Failed to read config file: " .. config_path, vim.log.levels.ERROR)
    return
  end

  -- Format the content nicely
  local content = table.concat(config_content, "\n")

  -- Try to pretty-print if it looks like JSON
  local ok, formatted = pcall(vim.json.pretty_print, config_content)
  if ok and formatted then
    content = table.concat(vim.json.encode(vim.fn.json_decode(content)), "\n")
  end

  local width = math.floor(vim.o.columns * 0.5)
  local height = math.floor(vim.o.lines * 0.4)
  local row = math.floor((vim.o.lines - height) / 2 - 1)
  local col = math.floor((vim.o.columns - width) / 2)

  local buf = vim.api.nvim_create_buf(false, true)
  vim.bo[buf].buftype = "nofile"
  vim.bo[buf].bufhidden = "wipe"
  vim.bo[buf].swapfile = false
  vim.bo[buf].modifiable = true

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    row = row,
    col = col,
    width = width,
    height = height,
    style = "minimal",
    border = "rounded",
    title = " Prettier Config: " .. config_path .. " ",
    title_pos = "center",
  })

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(content, "\n", { plain = true }))

  -- Detect filetype from config extension
  local ext = vim.fn.fnamemodify(config_path, ":e")
  if ext == "json" or ext == "jsonc" then
    vim.bo[buf].filetype = "json"
  elseif ext == "yaml" or ext == "yml" then
    vim.bo[buf].filetype = "yaml"
  elseif ext == "js" or ext == "cjs" or ext == "mjs" then
    vim.bo[buf].filetype = "javascript"
  elseif ext == "toml" then
    vim.bo[buf].filetype = "toml"
  end

  vim.bo[buf].modifiable = false
  vim.bo[buf].readonly = true

  local close = function()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end

  vim.keymap.set("n", "q", close, { buffer = buf, silent = true, nowait = true })
  vim.keymap.set("n", "<Esc>", close, { buffer = buf, silent = true, nowait = true })
end, { desc = "Show current Prettier configuration" })
