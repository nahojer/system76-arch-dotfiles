local M = {}

M.gmap = function(tbl)
  vim.keymap.set('', tbl[1], tbl[2], tbl[3])
end

M.nmap = function(tbl)
  vim.keymap.set('n', tbl[1], tbl[2], tbl[3])
end

M.vmap = function(tbl)
  vim.keymap.set('v', tbl[1], tbl[2], tbl[3])
end

M.imap = function(tbl)
  vim.keymap.set('i', tbl[1], tbl[2], tbl[3])
end

M.cmap = function(tbl)
  vim.keymap.set('c', tbl[1], tbl[2], tbl[3])
end

M.tmap = function(tbl)
  vim.keymap.set('t', tbl[1], tbl[2], tbl[3])
end

return M
