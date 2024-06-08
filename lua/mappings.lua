vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = function(mode, keys, func, desc)
  vim.keymap.set(mode, keys, func, { desc = desc })
end

-- Clear highlight on search when pressing <Esc> in normal mode
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Insert Moving
map('i', '<C-e>', '<End>', 'Move End of Line')
map('i', '<C-h>', '<Left>', 'Move Left')
map('i', '<C-l>', '<Right>', 'Move Right')
map('i', '<C-j>', '<Down>', 'Move Down')
map('i', '<C-k>', '<Up>', 'Move Up')

-- Buffers
map('n', '<leader>bn', '<cmd>bnext<CR>', '[B]uffer [N]ext')
map('n', '<leader>bp', '<cmd>bprevious<CR>', '[B]uffer [P]revious')
map('n', '<leader>bf', '<cmd>bfirst<CR>', '[B]uffer [F]irst')
map('n', '<leader>bl', '<cmd>blast<CR>', '[B]uffer [L]ast')

-- Windows
map('n', '<C-h>', '<C-w><C-h>', 'Move focus to the left window')
map('n', '<C-l>', '<C-w><C-l>', 'Move focus to the right window')
map('n', '<C-j>', '<C-w><C-j>', 'Move focus to the lower window')
map('n', '<C-k>', '<C-w><C-k>', 'Move focus to the upper window')

-- I need to get nvcheatsheet
-- map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })

-- LSP
map('n', '<leader>cf', vim.lsp.buf.format, 'LSP: [C]ode [F]ormat')

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, 'Go to previous [D]iagnostic message')
map('n', ']d', vim.diagnostic.goto_next, 'Go to next [D]iagnostic message')
map('n', '<leader>e', vim.diagnostic.open_float, 'Show diagnostic [E]rror messages')
map('n', '<leader>q', vim.diagnostic.setloclist, 'Open diagnostic [Q]uickfix list')

-- Search
-- I can move Telescope here but I need to figure out the relation
-- between built in func name and :Telescope <command>
