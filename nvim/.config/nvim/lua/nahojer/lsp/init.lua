require('mason').setup {
  install_root_dir = os.getenv 'HOME' .. '/.local/bin/nvim-mason/',
}

require('mason-lspconfig').setup { automatic_installation = true }

local handlers = require 'nahojer.lsp.handlers'

local function generic_on_attach()
  local nmap = require('nahojer.keymap').nmap
  nmap { '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', { silent = true, noremap = true, desc = 'Perform a code action' } }
  nmap { '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', { silent = true, noremap = true, desc = 'Rename' } }
  nmap { 'gd', '<cmd>Telescope lsp_definitions<CR>', { silent = true, noremap = true, desc = 'Go to definition' } }
  nmap { 'gT', '<cmd>Telescope lsp_type_definitions<CR>', { silent = true, noremap = true, desc = 'Go to type definition' } }
  nmap { 'gr', '<cmd>Telescope lsp_references<CR>', { silent = true, noremap = true, desc = 'Go to references' } }
  nmap { 'gI', handlers.implementation, { buffer = 0, silent = true, noremap = true, desc = 'Go to implementation' } }
  nmap { '<leader>d', '<cmd>Telescope diagnostics bufnr=0<CR>', { silent = true, noremap = true, desc = 'Open diagnostics picker' } }
  nmap { '<leader>D', '<cmd>Telescope diagnostics<CR>', { silent = true, noremap = true, desc = 'Open workspace diagnostics picker' } }
  nmap { '<leader>k', handlers.hover, { silent = true, noremap = true, desc = 'Show docs for item under cursor' } }
  nmap { ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', { silent = true, noremap = true, desc = 'Go to next diagnostic' } }
  nmap { '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { silent = true, noremap = true, desc = 'Go to previous diagnostic' } }
  nmap { '<leader>s', '<cmd>Telescope lsp_document_symbols<CR>', { silent = true, noremap = true, desc = 'Open symbol picker' } }
  nmap { '<leader>S', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>', { silent = true, noremap = true, desc = 'Open workspace symbol picker' } }
end

local updated_capabilities = vim.lsp.protocol.make_client_capabilities()

-- Completion configuration
vim.tbl_deep_extend('force', updated_capabilities, require('cmp_nvim_lsp').default_capabilities())
updated_capabilities.textDocument.completion.completionItem.insertReplaceSupport = false

local servers = {
  gopls = require('nahojer.lsp.go').config,
  tsserver = require('nahojer.lsp.tsserver').config,
  lua_ls = require('nahojer.lsp.lua').config,
  zls = require('nahojer.lsp.zig').config,
  bashls = {},
}

local lspconfig = require 'lspconfig'
for server, config in pairs(servers) do
  local on_attach = config.on_attach
  config.on_attach = function(client, bufnr)
    if on_attach ~= nil then
      on_attach(client, bufnr)
    end
    generic_on_attach()
  end
  local capabilities = config.capabilities or {}
  config.capabilities = vim.tbl_deep_extend('force', capabilities, updated_capabilities)
  lspconfig[server].setup(config)
end

require('null-ls').setup(require('nahojer.lsp.null_ls').config)

-- Needs to setup after null-ls
require('mason-null-ls').setup { automatic_installation = true }
