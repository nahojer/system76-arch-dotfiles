local augroup = vim.api.nvim_create_augroup('lua_lsp', { clear = true })

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  group = augroup,
  desc = 'Format before save',
  callback = function()
    vim.lsp.buf.format()
  end,
})
