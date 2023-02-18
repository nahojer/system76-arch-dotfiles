vim.diagnostic.config({
  virtual_text = false,
  underline = true,
  signs = true,
  float = {
    source = true,
    focusable = false,
  },
  severity_sort = true,
}, nil)

vim.api.nvim_command 'sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl='
vim.api.nvim_command 'sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl='
vim.api.nvim_command 'sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl='
vim.api.nvim_command 'sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl='

vim.api.nvim_command "autocmd CursorHold * lua vim.diagnostic.open_float(nil, {scope = 'line'})"
vim.api.nvim_command [[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]]
