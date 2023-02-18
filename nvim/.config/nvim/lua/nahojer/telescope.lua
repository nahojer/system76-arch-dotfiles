local M = {}

local no_preview = function()
  return require('telescope.themes').get_ivy { previewer = false }
end

M.find_files = function()
  require('telescope.builtin').find_files(no_preview())
end

M.git_files = function()
  require('telescope.builtin').git_files(no_preview())
end

M.buffers = function()
  require('telescope.builtin').buffers(vim.tbl_deep_extend('force', no_preview(), {
    layout_config = {
      height = 12,
    },
  }))
end

M.live_grep = function()
  require('telescope.builtin').live_grep(require('telescope.themes').get_ivy {})
end

M.current_buffer_fuzzy_find = function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    layout_strategy = 'horizontal',
    layout_config = {
      width = 0.90,
      height = 0.90,
      preview_width = 0.60,
    },
  })
end
return M
