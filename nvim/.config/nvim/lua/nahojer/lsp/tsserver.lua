local M = {}

M.config = {
  flags = {
    debounce_text_changes = 150,
  },
  root_dir = require('lspconfig.util').root_pattern 'package.json',
}

return M
