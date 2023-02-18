local gmap = require('nahojer.keymap').gmap
local nmap = require('nahojer.keymap').nmap
local vmap = require('nahojer.keymap').vmap
local imap = require('nahojer.keymap').imap

local function opts(desc)
  return { silent = true, desc = desc }
end

gmap { '<Space>', '<Nop>', opts() }
vim.g.mapleader = ' '

nmap { 'Q', '<Nop>', opts() } -- no Ex mode

nmap { '<C-s>', ':w<CR>', opts 'Save buf' }

nmap { '<C-c>', '<ESC>', opts 'Escape' }

nmap { ']q', ':cnext<CR>', opts 'Next qf' }
nmap { '[q', ':cprev<CR>', opts 'Prev qf' }
nmap { '<C-q>', ':call QuickFixToggle()<CR>', opts 'Toggle qf' }

nmap { '<S-l>', ':bnext<CR>', opts 'Next buffer' }
nmap { '<S-h>', ':bprevious<CR>', opts 'Prev buffer' }

nmap { '<Up>', ':resize -2<CR>', opts 'Resize win up' }
nmap { '<Down>', ':resize +2<CR>', opts 'Resize win down' }
nmap { '<Left>', ':vertical resize +2<CR>', opts 'Resize win left' }
nmap { '<Right>', ':vertical resize -2<CR>', opts 'Resize win right' }

-- always center
nmap { '<C-d>', '<C-d>zz', opts() }
nmap { '<C-u>', '<C-u>zz', opts() }
nmap { 'n', 'nzzzv', opts() }
nmap { 'N', 'Nzzzv', opts() }
nmap { 'J', 'mzJ`z', opts() }

nmap { 'Y', 'yg$', opts() }

nmap { '<M-j>', ':m .+1<CR>==', opts 'Move line up' }
nmap { '<M-k>', ':m .-2<CR>==', opts 'Move line down' }
vmap { 'J', ":m '>+1<CR>gv=gv", opts() }
vmap { 'K', ":m '<-2<CR>gv=gv", opts() }

imap { '<Up>', '<Nop>', opts() }
imap { '<Down>', '<Nop>', opts() }
imap { '<Left>', '<Nop>', opts() }
imap { '<Down>', '<Nop>', opts() }

-- undo breakpoints
imap { ',', ',<c-g>u', opts() }
imap { '.', '.<c-g>u', opts() }
imap { '!', '!<c-g>u', opts() }
imap { '?', '?<c-g>u', opts() }
imap { ' ', ' <c-g>u', opts() }

-- stay in indent mode.
vmap { '<', '<gv', opts() }
vmap { '>', '>gv', opts() }

nmap { '<leader>e', '<cmd>:Lexplore<CR>', opts 'Explorer' }
nmap { '<leader>E', '<cmd>:Lexplore %:p:h<CR>', opts 'Explorer (cwd)' }

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.cmd [[
	" Saner behavior of n and N.
	" The direction of n and N depends on whether / or ? was used for searching
	" forward or backward respectively. The following makes n to always search
	" forward and N backward.
	nnoremap <expr> n  'Nn'[v:searchforward]
	xnoremap <expr> n  'Nn'[v:searchforward]
	onoremap <expr> n  'Nn'[v:searchforward]
	nnoremap <expr> N  'nN'[v:searchforward]
	xnoremap <expr> N  'nN'[v:searchforward]
	onoremap <expr> N  'nN'[v:searchforward]

	" Saner command-line history.
	" <Up> and <Down> are smarter than <C-n> and <C-p>. They recall the
	" command-line whose beginning matches the current command-line. E.g.
	" :echo <Up> may change to :echo "Vim rocks!".
  cnoremap <expr> <c-p> wildmenumode() ? "\<C-p>" : "\<Up>"
	cnoremap <expr> <c-n> wildmenumode() ? "\<C-n>" : "\<Down>"

	" Redraw window.
	" By default, <C-l> clears and redraws the screen (like :redraw!).
	" The following mapping does the same, plus de-highlighting the matches
	" found via /, ? etc., plus fixing syntax highlighting (sometimes Vim
	" loses highlighting due to complex highlighting rules), plus force
	" updating the syntax highlighting in diff mode:
	nnoremap <C-l> :nohlsearch<CR>:diffupdate<CR>:syntax sync fromstart<CR><C-l>

	" Quickly edit macros.
	" Takes a register (or * by default) and opens it in the cmdline-window.
	" Hit <cr> when you're done editing for setting the register
	nnoremap <leader>m  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>
]]
