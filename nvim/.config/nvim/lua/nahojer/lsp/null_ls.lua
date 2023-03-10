local null_ls = require 'null-ls'
local Job = require 'plenary.job'

local M = {}

M.config = {
  sources = {
    null_ls.builtins.formatting.stylua,

    null_ls.builtins.diagnostics.golangci_lint.with {
      args = {
        'run',
        '--fix=false',
        '--build-tags=integration_test',
        '--out-format=json',
        '$DIRNAME',
        '--path-prefix',
        '$ROOT',
      },
    },

    null_ls.builtins.formatting.zigfmt,

    -- shell / bash
    null_ls.builtins.diagnostics.shellcheck,

    -- typescript
    null_ls.builtins.formatting.eslint_d.with {
      on_attach = function()
        Job:new({ command = 'eslint_d', args = { 'restart' } }):sync()
      end,
    },
    null_ls.builtins.diagnostics.eslint_d.with {
      on_attach = function()
        Job:new({ command = 'eslint_d', args = { 'restart' } }):sync()
      end,
      condition = function(utils)
        return utils.root_has_file { '.eslintrc' }
      end,
    },
    null_ls.builtins.code_actions.eslint_d,
  },
}

return M
