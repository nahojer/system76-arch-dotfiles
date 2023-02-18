return require('lazy').setup {
  -- Core
  'tpope/vim-commentary',
  'tpope/vim-surround',

  -- Theme and styling
  { 'rose-pine/neovim', name = 'rose-pine', lazy = false, priority = 1000 },
  'nvim-lualine/lualine.nvim',
  'kyazdani42/nvim-web-devicons',
  'chentoast/marks.nvim',

  -- Syntax
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  'nvim-treesitter/nvim-treesitter-context',
  'JoosepAlviste/nvim-ts-context-commentstring',
  'ntpeters/vim-better-whitespace',
  'brenoprata10/nvim-highlight-colors',

  -- Language Server Protocol
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'jay-babu/mason-null-ls.nvim',
  'neovim/nvim-lspconfig',
  { 'jose-elias-alvarez/null-ls.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },

  -- Search / Navigation
  { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } } },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
}
