local function qj(direction)
  local flags = 'bz'
  local regex = [[^\\(package\\|import\\|type\\|const\\|var\\|func\\)]]
  if direction == 'down' then
    flags = ''
  end
  local command = string.format('execute search("%s", "%s")', regex, flags)
  vim.api.nvim_exec(command, nil)
end

local function qj_up()
  qj 'up'
end

local function qj_down()
  qj 'down'
end

local opts = { silent = true, buffer = true }
vim.keymap.set('n', '[[', qj_up, opts)
vim.keymap.set('n', ']]', qj_down, opts)
vim.keymap.set('v', '[[', qj_up, opts)
vim.keymap.set('v', ']]', qj_down, opts)
