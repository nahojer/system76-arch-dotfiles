local M = {}

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new { cmd = 'lazygit', hidden = true }
local lazydocker = Terminal:new { cmd = 'lazydocker', hidden = true }

M.ToggleLazyGit = function()
  lazygit:toggle()
end

M.ToggleLazyDocker = function()
  lazydocker:toggle()
end

return M
