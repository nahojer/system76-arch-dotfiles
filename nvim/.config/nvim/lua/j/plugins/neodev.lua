local M = {}

local name = "neodev"

local ok, plugin = pcall(require, name)
if not ok then
  M.setup = function()
    P("Attempting to require not installed plugin " .. name)
  end
  return M
end

M.setup = function()
  plugin.setup()
end

return M
