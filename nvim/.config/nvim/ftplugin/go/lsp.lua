local function goimports(wait_ms)
  local params = vim.lsp.util.make_range_params()
  params.context = { only = { 'source.organizeImports' } }
  local result = vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params, wait_ms)
  for _, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        vim.lsp.util.apply_workspace_edit(r.edit, 'UTF-8')
      else
        vim.lsp.buf.execute_command(r.command)
      end
    end
  end
end

local augroup = vim.api.nvim_create_augroup('go_lsp', { clear = true })

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  group = augroup,
  desc = 'Format before save',
  callback = function()
    if not vim.lsp.buf.server_ready() then
      return
    end

    local fmtopts = { async = true }
    if vim.fn.executable 'goimports' == 0 then
      vim.lsp.buf.format(fmtopts)
    else
      vim.lsp.buf.format(fmtopts)
      goimports(1000)
    end
  end,
})
