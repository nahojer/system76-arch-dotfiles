require('toggleterm').setup {
  open_mapping = [[<C-w>t]],
  hide_numbers = true,
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  close_on_exit = true,
  direction = 'float',
  float_opts = {
    -- border = 'curved',
    winblend = 0,
    highlights = {
      border = 'Normal',
      background = 'Normal',
    },
  },
  size = 20,
  shell = vim.o.shell,
}

local tmap = require('nahojer.keymap').tmap
local nmap = require('nahojer.keymap').nmap
tmap { '<esc>', '<C-\\><C-n>', { silent = true, desc = 'Exit terminal mode' } }
nmap { '<leader>tg', '<cmd>lua require("nahojer.toggleterm").ToggleLazyGit()<CR>', { silent = true, desc = 'Toggle LazyGit' } }
tmap { '<leader>tg', '<cmd>lua require("nahojer.toggleterm").ToggleLazyGit()<CR>', { silent = true, desc = 'Toggle LazyGit' } }
nmap { '<leader>td', '<cmd>lua require("nahojer.toggleterm").ToggleLazyDocker()<CR>', { silent = true, desc = 'Toggle LazyDocker' } }
tmap { '<leader>td', '<cmd>lua require("nahojer.toggleterm").ToggleLazyDocker()<CR>', { silent = true, desc = 'Toggle LazyDocker' } }
