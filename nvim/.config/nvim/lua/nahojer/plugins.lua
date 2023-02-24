return require('lazy').setup {
  -- Core
  'numToStr/Comment.nvim',
  { 'kylechui/nvim-surround', tag = '*' },

  -- Theme and styling
  { 'rose-pine/neovim', name = 'rose-pine', lazy = false, priority = 1000 },
  'nvim-lualine/lualine.nvim',
  'kyazdani42/nvim-web-devicons',
  'chentoast/marks.nvim',

  -- Syntax
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  'nvim-treesitter/nvim-treesitter-context',
  'JoosepAlviste/nvim-ts-context-commentstring',
  'norcalli/nvim-colorizer.lua',
  'nvim-treesitter/nvim-treesitter-textobjects',

  -- Language Server Protocol
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'jay-babu/mason-null-ls.nvim',
  'neovim/nvim-lspconfig',
  { 'jose-elias-alvarez/null-ls.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
  'ray-x/lsp_signature.nvim',

  -- Snippets
  { 'L3MON4D3/LuaSnip', build = 'make install_jsregexp' }, -- note: required by cmp

  -- Completion
  'hrsh7th/nvim-cmp', -- auto completion
  'hrsh7th/cmp-buffer', -- source buffers
  'hrsh7th/cmp-path', -- source path
  'hrsh7th/cmp-nvim-lua', -- source nvim lua
  'hrsh7th/cmp-nvim-lsp', -- source nvim lsp
  'onsails/lspkind-nvim', -- fancy icons for completion
  'windwp/nvim-autopairs',

  -- Search / Navigation
  { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' } },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  'nvim-telescope/telescope-media-files.nvim',

  -- Terminal
  { 'akinsho/toggleterm.nvim', version = '*', config = true },
}
