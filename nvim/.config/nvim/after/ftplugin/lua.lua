local augroup = vim.api.nvim_create_augroup('lua_lsp', { clear = true })

vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '*',
  group = augroup,
  desc = 'Format on save',
  callback = function()
    vim.lsp.buf.format()
  end,
})
