-- Auto equalize splits when Vim is resized.
vim.api.nvim_command 'autocmd VimResized * wincmd ='

-- Fix format options
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  callback = function()
    --[[
      - "a" -- Auto formatting is BAD.
      - "t" -- Don't auto format my code. I got linters for that.
      + "c" -- In general, I like it when comments respect textwidth
      + "q" -- Allow formatting comments w/ gq
      - "o" -- O and o, don't continue comments
      + "r" -- But do continue when pressing enter.
      + "n" -- Indent past the formatlistpat, not underneath it.
      + "j" -- Auto-remove comments if possible.
      - "2" -- I'm not in gradeschool anymore
    --]]
    vim.opt.formatoptions = vim.opt.formatoptions - { 'a', 't', 'o', '2' }
  end,
})
