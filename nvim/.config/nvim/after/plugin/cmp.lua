local cmp = require 'cmp'
local luasnip = require 'luasnip'

cmp.setup {
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
    ['<C-p>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-y>'] = cmp.mapping(
      cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      { 'i', 'c' }
    ),
    ['<enter>'] = cmp.mapping(
      cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      { 'i', 'c' }
    ),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'buffer', keyword_length = 5 },
    { name = 'path' },
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  formatting = {
    format = require('lspkind').cmp_format {
      with_text = false,
      maxwidth = 50,
      menu = {
        buffer = '[buf]',
        nvim_lsp = '[lsp]',
        luasnip = '[snip]',
        nvim_lua = '[lua]',
        path = '[path]',
        tn = '[TabNine]',
      },
    },
  },
  experimental = {
    -- I like the new menu better! Nice work hrsh7th
    native_menu = false,

    -- Let's play with this for a day or two
    ghost_text = true,
  },
}

_ = vim.cmd [[
  augroup CmpZsh
    au!
    autocmd Filetype zsh lua require'cmp'.setup.buffer { sources = { { name = "zsh" }, } }
  augroup END
]]
