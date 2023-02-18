return require('lazy').setup {
  -- Core
  'tpope/vim-commentary',

  -- Theme and styling
  { 'rose-pine/neovim', name = 'rose-pine', lazy = false, priority = 1000 },
  'nvim-lualine/lualine.nvim',
  'kyazdani42/nvim-web-devicons', -- note: requires patched fonts

  -- Syntax
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  'nvim-treesitter/nvim-treesitter-context',

  -- Language Server Protocol
  'williamboman/mason.nvim', -- Package manager for LSP, linters etc
  'williamboman/mason-lspconfig.nvim',
  'jay-babu/mason-null-ls.nvim',
  'neovim/nvim-lspconfig',
  { 'jose-elias-alvarez/null-ls.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },

  -- Search / Navigation
  { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } } },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
}
