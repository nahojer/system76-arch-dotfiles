local M = {}

local plugins = {
 "neodev",
}

M.setup = function()
  for _, plugin in ipairs(plugins) do
    local ok, config = pcall(require, 'j.plugins.' .. plugin)
    if ok then
      config.setup()
    end
  end
end

return M
