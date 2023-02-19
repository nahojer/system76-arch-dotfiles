local M = {}

M.config = {
  on_attach = function(_, bufnr)
    -- https://github.com/ray-x/lsp_signature.nvim#full-configuration-with-default-values
    require('lsp_signature').on_attach({
      floating_window = false,
    }, bufnr)
  end,
}

return M
