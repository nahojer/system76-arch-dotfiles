local parser_install_dir = '$HOME/.local/state/nvim/treesitter'
vim.opt.runtimepath:append(parser_install_dir)

require('nvim-treesitter.configs').setup {
  parser_install_dir = parser_install_dir,
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

require('nvim-treesitter.configs').setup {
  context_commentstring = {
    enable = true,
    config = {
      zig = '// %s',
    },
  },
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        -- You can optionally set descriptions to the mappings (used in the desc parameter of
        -- nvim_buf_set_keymap) which plugins like which-key display
        ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class region' },
        -- You can also use captures from other query groups like `locals.scm`
        ['as'] = { query = '@scope', query_group = 'locals', desc = 'Select language scope' },
      },
      -- You can choose the select mode (default is charwise 'v')
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * method: eg 'v' or 'o'
      -- and should return the mode ('v', 'V', or '<c-v>') or a table
      -- mapping query_strings to modes.
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
      -- If you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding or succeeding whitespace. Succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * selection_mode: eg 'v'
      -- and should return true of false
      include_surrounding_whitespace = true,
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']f'] = '@function.outer',
        [']]'] = { query = '@class.outer', desc = 'Next class start' },
      },
      goto_next_end = {
        [']F'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[f'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[F'] = '@function.outer',
        ['[]'] = '@class.outer',
      },

      -- TODO: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
      -- ]d next diagnositc
      -- ]D last diagnositc
      -- [d prev diagnostic
      -- [D first diagnostic
      -- ]d next git change
      -- ]D last git change
      -- [d prev git change
      -- [D first git change
      -- ]a next function argument
      -- [a prev function argument
    },
  },
}
