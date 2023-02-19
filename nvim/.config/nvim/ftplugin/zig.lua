local augroup = vim.api.nvim_create_augroup('zig_lsp', { clear = true })

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.zig',
  group = augroup,
  desc = 'Format before save',
  callback = function()
    if not vim.lsp.buf.server_ready() then
      return
    end
    vim.lsp.buf.format { async = true }
  end,
})
