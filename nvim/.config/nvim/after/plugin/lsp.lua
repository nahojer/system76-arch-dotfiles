require('mason').setup {
  install_root_dir = os.getenv 'HOME' .. '/.local/bin/nvim-mason/',
}

require('mason-lspconfig').setup { automatic_installation = true }

require('lspconfig').gopls.setup(require('nahojer.lsp.go').config)
require('lspconfig').tsserver.setup(require('nahojer.lsp.tsserver').config)
require('lspconfig').lua_ls.setup(require('nahojer.lsp.lua').config)
require('lspconfig').bashls.setup {}
require('null-ls').setup(require('nahojer.lsp.null_ls').config)

-- Needs to setup after null-ls
require('mason-null-ls').setup { automatic_installation = true }
