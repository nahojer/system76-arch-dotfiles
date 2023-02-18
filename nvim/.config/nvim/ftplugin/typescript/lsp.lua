local augroup = vim.api.nvim_create_augroup('ts_lsp', { clear = true })

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = {'*.ts', '*.tsx'},
  group = augroup,
  desc = 'Format on save',
  callback = function()
    vim.lsp.buf.format({filter = function(client) return client.name ~= "tsserver" end})
  end,
})