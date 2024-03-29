vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.handlers['textDocument/publishDiagnostics'], {
  signs = {
    severity_limit = 'Error',
  },
  underline = {
    severity_limit = 'Warning',
  },
  virtual_text = true,
})

local M = {}

M.implementation = function()
  local params = vim.lsp.util.make_position_params()

  vim.lsp.buf_request(0, 'textDocument/implementation', params, function(err, result, ctx, config)
    if result == nil then
      return
    end

    local bufnr = ctx.bufnr
    local ft = vim.api.nvim_buf_get_option(bufnr, 'filetype')

    -- In Go code, I do not like to see any mocks for impls...
    if ft == 'go' then
      local new_result = vim.tbl_filter(function(v)
        return not (string.find(v.uri, 'mock_') or string.find(v.uri, 'mock/') or string.find(v.uri, 'mocks/'))
      end, result)

      if #new_result > 0 then
        result = new_result
      end
    end

    vim.lsp.handlers['textDocument/implementation'](err, result, ctx, config)
    vim.cmd [[normal! zz]]
  end)
end

M.hover = function()
  -- Fixes issue where the CursorHold autocmd for showing diagnostics
  -- would trigger when trying to Hover on the same line.
  vim.api.nvim_command 'set eventignore=CursorHold'
  vim.api.nvim_command 'autocmd CursorMoved <buffer> ++once set eventignore=""'
  vim.lsp.buf.hover()
end

return M
