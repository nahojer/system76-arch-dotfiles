require('telescope').setup {
  defaults = {
    preview = {
      msg_bg_fillchar = '░',
    },
    layout_strategy = 'horizontal',
    layout_config = {
      width = 0.90,
      height = 0.90,
    },
  },
  file_ignore_patterns = { '.git/', 'node_modules/', 'vendor/', '.cache/', '.vscode/', '*/tmp/*', 'Cargo.lock', '*pycache', '*.o' },
  pickers = {
    find_files = {
      additional_args = { '--ignore', '--hidden', '--files', '--fixed-strings' },
    },
    live_grep = {
      additional_args = {
        '--color=never',
        '--no-heading',
        '--hidden',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
        '--fixed-strings',
        '--multiline',
      },
    },
    grep_string = {
      additional_args = {
        '--color=never',
        '--no-heading',
        '--hidden',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
        '--fixed-strings',
        '--multiline',
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
    },
    file_browser = {
      theme = 'ivy',
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ['i'] = {
          -- your custom insert mode mappings
        },
        ['n'] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
}

require('telescope').load_extension 'fzf'
require('telescope').load_extension 'file_browser'

local nmap = require('nahojer.keymap').nmap

local function opts(desc)
  return { silent = true, desc = desc }
end

nmap { '<leader>ff', '<cmd>lua require("nahojer.telescope").find_files()<CR>', opts 'Find file' }
nmap { '<leader>fg', '<cmd>lua require("nahojer.telescope").git_files()<CR>', opts 'Find Git file' }
nmap {
  '<leader>/',
  '<cmd>lua require("nahojer.telescope").live_grep()<CR>',
  opts 'Find text',
}
nmap { '<leader>fb', '<cmd>lua require("nahojer.telescope").buffers()<CR>', opts 'Find buf' }
nmap { '<leader>ft', '<cmd>lua require("nahojer.telescope").current_buffer_fuzzy_find()<CR>', opts 'Fuzzy find text' }
