-- Some of these were already in kickstart.
-- Some were ripped from nvchad.
-- Some were ripped from ThePrimeagen.
-- Some are me not know wtf nvims normal keybinds are...

local map = function(mode, keys, func, desc)
  vim.keymap.set(mode, keys, func, { desc = desc })
end

-- Clear highlight on search when pressing <Esc> in normal mode
map('n', '<Esc>', '<cmd>nohlsearch<cr>')

-- Insert Moving
map('i', '<C-e>', '<End>', 'Move End of Line')
map('i', '<C-h>', '<Left>', 'Move Left')
map('i', '<C-l>', '<Right>', 'Move Right')
map('i', '<C-j>', '<Down>', 'Move Down')
map('i', '<C-k>', '<Up>', 'Move Up')

-- Highlight Moving. Allows you to move selected text
map('v', 'J', ":m '>+1<cr>gv=gv")
map('v', 'K', ":m '<-2<cr>gv=gv")

-- Keep cursor in the middle of screen when half jumping
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

-- Buffers
map('n', '<leader>bn', '<cmd>bnext<cr>', '[B]uffer [N]ext')
map('n', '<leader>bp', '<cmd>bprevious<cr>', '[B]uffer [P]revious')
map('n', '<leader>bf', '<cmd>bfirst<cr>', '[B]uffer [F]irst')
map('n', '<leader>bl', '<cmd>blast<cr>', '[B]uffer [L]ast')
map('n', '<leader>bd', '<cmd>bd<cr>', '[B]uffer [D]elete')
map('n', '<leader>bl', '<cmd>ls<cr>', '[B]uffer [L]ist')

-- Windows
map('n', '<C-h>', '<C-w><C-h>', 'Move focus to the left window')
map('n', '<C-l>', '<C-w><C-l>', 'Move focus to the right window')
map('n', '<C-j>', '<C-w><C-j>', 'Move focus to the lower window')
map('n', '<C-k>', '<C-w><C-k>', 'Move focus to the upper window')

-- Sessions
map('n', '<leader>Sr', '<cmd>SessionRestore<cr>', '[S]ession [R]estore')
map('n', '<leader>Ss', '<cmd>SessionSave<cr>', '[S]ession [S]ave')

-- Explorer
map('n', '<leader>pv', vim.cmd.Ex, '[P]roject [V]iew')

-- Code
map('n', '<leader>cf', vim.lsp.buf.format, 'LSP: [C]ode [F]ormat')
map('n', '<leader>cd', function()
  require('neogen').generate()
end, '[C]ode [D]oc Comment')

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, 'Go to previous [D]iagnostic message')
map('n', ']d', vim.diagnostic.goto_next, 'Go to next [D]iagnostic message')
map('n', '<leader>ee', vim.diagnostic.open_float, 'Show diagnostic [E]rror messages')
map('n', '<leader>eq', vim.diagnostic.setloclist, 'Open diagnostic [Q]uickfix list')
map('n', '<leader>en', function()
  require('trouble').next { mode = 'diagnostics', jump = true, skip_groups = true }
end, 'Trouble: Jump to [n]ext issue')
map('n', '<leader>ep', function()
  require('trouble').prev { mode = 'diagnostics', jump = true, skip_groups = true }
end, 'Trouble: Jump to [p]revious issue')

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
map('n', '<leader>s/', function()
  require('telescope.builtin').live_grep { grep_open_files = true, prompt_title = 'Live Grep in Open Files' }
end, '[S]earch [/] in Open Files')
map('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { winblend = 10, previewer = false })
end, '[/] Fuzzily search in current buffer')
map('n', '<leader>sn', function()
  require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
end, '[S]earch [N]eovim files')
