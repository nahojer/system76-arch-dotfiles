
-- Setup globals that I expect to be always available.
-- See `./lua/j/globals.lua` for more information.
require "j.globals"

local has_packer, packer = pcall(require, 'j.packer')
if has_packer then
  -- When we are bootstrapping a configuration, it doesn't
  -- make sense to execute the rest of init.lua.
  --
  -- Restart nvim for it to work.
  if packer.is_bootstrap then
    print '=================================='
    print '    Plugins are being installed'
    print '    Wait until Packer completes,'
    print '       then restart nvim'
    print '=================================='
  end
end

-- Automatically source and re-compile packer whenever you save this init.lua files.
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

-- Setup plugins.
local has_plugins, plugins = pcall(require, 'j.plugins')
if has_plugins then
  plugins.setup()
end

-- Configure options.
vim.o.hlsearch = false
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'
vim.o.termguicolors = true
vim.o.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
