return require("lazy").setup({
	-- Theme and styling
	{'rose-pine/neovim', name = 'rose-pine', lazy = false, priority = 1000},
	'nvim-lualine/lualine.nvim',
	'kyazdani42/nvim-web-devicons', -- note: requires patched fonts

	-- Syntax
	{'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
	'nvim-treesitter/nvim-treesitter-context',
})
