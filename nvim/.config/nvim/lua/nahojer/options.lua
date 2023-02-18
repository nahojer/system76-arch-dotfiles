local o = vim.opt

o.encoding = 'utf-8'
o.fileencoding = 'utf-8'

o.incsearch = true -- make search act like search in modern browsers
o.hlsearch = false -- highlight all matches on previous search pattern
o.ignorecase = true -- ignore case in search patterns, unless /C or capital in search

o.smartcase = true -- smart case
o.smartindent = true -- make indenting smarter again

o.splitbelow = true -- force all horizontal splits to go below current window
o.splitright = true -- force all vertical splits to go to the right of current window

o.swapfile = false -- living on the edge
o.undofile = true -- enable persistent undo
o.writebackup = false
o.hidden = true -- allow unsaved buffers

o.updatetime = 300 -- faster completion (4000ms default)

o.showmode = false

o.termguicolors = true

o.number = true
o.relativenumber = true
o.signcolumn = 'yes' -- always show the sign column, otherwise it would shift the text each time

o.laststatus = 2 -- always show status line
o.cmdheight = 1
o.showcmd = true

o.scrolloff = 8 -- number of context lines above/below cursor
o.sidescrolloff = 8

o.cursorline = true -- use cursorline...
o.cursorlineopt = { 'number' } -- but only highlight the linenumber

o.textwidth = 0 -- never auto break lines when typing

o.showmatch = true -- show matching brackets when text indicator is over them

o.iskeyword:append '-' -- treat words with hyphens in them as a single word

o.belloff = 'all' -- just turn the dang bell off

o.fillchars.eob = ' ' -- fillchars for empty lines at the end of buffer

o.autoindent = true -- copy indent from current line when starting a new line
o.cindent = true -- enables automatic C program indenting

o.tabstop = 2 -- number of spaces that a <Tab> in the file counts for
o.shiftwidth = 2 -- number of spaces to use for each step of (auto)indent. Used for 'cindent', >>, <<, etc
o.softtabstop = 2 -- number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>
o.expandtab = true -- convert tabs to spaces

o.wrap = false -- don't wrap long lines
o.whichwrap:append '<,>,[,],h,l'
o.showbreak = string.rep(' ', 3) -- make it so that long lines wrap smartly
o.breakindent = true
o.linebreak = true

o.foldmethod = 'manual'
o.foldlevel = 0 -- close all folds
o.modelines = 1

o.joinspaces = false -- two spaces and grade school, we're done

-- ignore patterns when searching
o.wildignore = { '*.o', '*~', '*.pyc', '*pycache*', 'Cargo.lock', '*/node_modules/*', '*/cache/*', '*/tmp/*', '*/vendor/' }

-- cool floating window popup menu for completion on command line
o.pumblend = 17
o.wildmode = 'longest:full'
o.wildoptions = 'pum'

o.completeopt = {
  'menu',
  'menuone', -- menu will come up even if there's only one match
  'noselect',
}
o.shortmess:append 'c' -- don't show redundant messages from ins-completion-menu

vim.cmd 'language en_US.utf8'

-- file explorer
vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 15
vim.g.netrw_banner = 0

vim.g['better_whitespace_guicolor'] = '#e0def4'
