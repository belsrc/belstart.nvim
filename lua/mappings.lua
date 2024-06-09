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

-- Code
map('n', '<leader>cf', vim.lsp.buf.format, 'LSP: [C]ode [F]ormat')

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, 'Go to previous [D]iagnostic message')
map('n', ']d', vim.diagnostic.goto_next, 'Go to next [D]iagnostic message')
map('n', '<leader>e', vim.diagnostic.open_float, 'Show diagnostic [E]rror messages')
map('n', '<leader>q', vim.diagnostic.setloclist, 'Open diagnostic [Q]uickfix list')

-- Search
map('n', '<leader>sh', '<cmd>Telescope help_tags<cr>', '[S]earch [H]elp')
map('n', '<leader>sk', '<cmd>Telescope keymaps<cr>', '[S]earch [K]eymaps')
map('n', '<leader>sf', '<cmd>Telescope find_files<cr>', '[S]earch [F]iles')
map('n', '<leader>ss', '<cmd>Telescope builtin<cr>', '[S]earch [S]elect Telescope')
map('n', '<leader>sw', '<cmd>Telescope grep_string<cr>', '[S]earch current [W]ord')
map('n', '<leader>sg', '<cmd>Telescope live_grep<cr>', '[S]earch by [G]rep')
map('n', '<leader>sd', '<cmd>Telescope diagnostics<cr>', '[S]earch [D]iagnostics')
map('n', '<leader>sr', '<cmd>Telescope resume<cr>', '[S]earch [R]esume')
map('n', '<leader>s.', '<cmd>Telescope oldfiles<cr>', '[S]earch Recent Files ("." for repeat)')
map('n', '<leader><leader>', '<cmd>Telescope buffers<cr>', '[ ] Find existing buffers')
map(
  'n',
  '<leader>s/',
  "<cmd>lua require('telescope.builtin').live_grep({ grep_open_files = true, prompt_title = 'Live Grep in Open Files'})<cr>",
  '[S]earch [/] in Open Files'
)
map(
  'n',
  '<leader>/',
  "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { winblend = 10, previewer = false })<cr>",
  '[/] Fuzzily search in current buffer'
)
map('n', '<leader>sn', "<cmd>lua require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }<cr>", '[S]earch [N]eovim files')
