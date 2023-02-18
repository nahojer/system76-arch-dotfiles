local fb_actions = require 'telescope._extensions.file_browser.actions'
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
      hidden = true,
      mappings = {
        ['i'] = {
          ['<A-c>'] = fb_actions.create,
          ['<S-CR>'] = fb_actions.create_from_prompt,
          ['<A-r>'] = fb_actions.rename,
          ['<A-m>'] = fb_actions.move,
          ['<A-y>'] = fb_actions.copy,
          ['<A-d>'] = fb_actions.remove,
          ['<C-o>'] = fb_actions.open,
          ['<C-g>'] = fb_actions.goto_parent_dir,
          ['<C-e>'] = fb_actions.goto_home_dir,
          ['<C-w>'] = fb_actions.goto_cwd,
          ['<C-t>'] = fb_actions.change_cwd,
          ['<C-f>'] = fb_actions.toggle_browser,
          ['<C-h>'] = fb_actions.toggle_hidden,
          ['<C-s>'] = fb_actions.toggle_all,
        },
        ['n'] = {
          ['c'] = fb_actions.create,
          ['r'] = fb_actions.rename,
          ['m'] = fb_actions.move,
          ['y'] = fb_actions.copy,
          ['d'] = fb_actions.remove,
          ['o'] = fb_actions.open,
          ['g'] = fb_actions.goto_parent_dir,
          ['e'] = fb_actions.goto_home_dir,
          ['w'] = fb_actions.goto_cwd,
          ['t'] = fb_actions.change_cwd,
          ['f'] = fb_actions.toggle_browser,
          ['h'] = fb_actions.toggle_hidden,
          ['s'] = fb_actions.toggle_all,
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

nmap { '<leader>e', '<cmd>Telescope file_browser<CR>', opts 'File browser' }
nmap { '<leader>E', '<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>', opts 'File browser (cwd)' }
