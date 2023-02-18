require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'bash',
    'css',
    'go',
    'gomod',
    'html',
    'javascript',
    'json',
    'lua',
    'python',
    'typescript',
    'yaml',
    'tsx',
    'dockerfile',
    'terraform',
    'markdown',
    'zig',
    'toml',
  },
  highlight = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  },
}

require('treesitter-context').setup {
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  max_lines = 1, -- How many lines the window should span. Values <= 0 mean no limit.
  patterns = {
    default = {
      'class',
      'function',
      'method',
    },
  },
}
