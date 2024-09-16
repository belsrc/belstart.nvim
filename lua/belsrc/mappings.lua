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

-- Wrapping selection
map('n', '<leader>w{', 'viwc{}<esc>P')
map('n', '<leader>w[', 'viwc[]<esc>P')
map('n', '<leader>w(', 'viwc()<esc>P')
map('n', "<leader>w'", "viwc''<esc>P")
map('v', '<leader>w{', 'c{}<esc>P')
map('v', '<leader>w[', 'c[]<esc>P')
map('v', '<leader>w(', 'c()<esc>P')
map('v', "<leader>w'", "c''<esc>P")

-- Keep cursor in the middle of screen when half jumping
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', 'G', 'Gzz')

-- Buffers
map('n', '<leader>bn', '<cmd>bnext<cr>', '[b]uffer [n]ext')
map('n', '<leader>bp', '<cmd>bprevious<cr>', '[b]uffer [p]revious')
map('n', '<leader>bf', '<cmd>bfirst<cr>', '[b]uffer [f]irst')
map('n', '<leader>bL', '<cmd>blast<cr>', '[b]uffer [L]ast')
map('n', '<leader>bd', '<cmd>bd<cr>', '[b]uffer [d]elete')
map('n', '<leader>bl', '<cmd>ls<cr>', '[b]uffer [l]ist')
map('n', '<leader>bN', '<cmd>enew<cr>', '[b]uffer [N]ew')
map('n', '<leader>bw', '<cmd>bwipeout!<cr>', '[b]uffer [w]ipeout')

-- Windows
map('n', '<C-h>', '<C-w><C-h>', 'Move focus to the left window')
map('n', '<C-l>', '<C-w><C-l>', 'Move focus to the right window')
map('n', '<C-j>', '<C-w><C-j>', 'Move focus to the lower window')
map('n', '<C-k>', '<C-w><C-k>', 'Move focus to the upper window')

-- Sessions
map('n', '<leader>Sr', '<cmd>SessionRestore<cr>', '[S]ession [r]estore')
map('n', '<leader>Ss', '<cmd>SessionSave<cr>', '[S]ession [s]ave')

-- Explorer
map('n', '<leader>pv', vim.cmd.Ex, '[p]roject [v]iew')
map('n', '<leader>po', '<cmd>Oil<cr>', '[p]roject [o]il view')

-- Restarts
map('n', '<leader>rl', '<cmd>LspRestart<cr>', 'Restart: [l]sp')
map('n', '<leader>rc', '<cmd>source %MYVIMRC<cr>', 'Restart: nvim [c]config')

-- Code
map('n', '<leader>cf', vim.lsp.buf.format, 'LSP: [c]ode [f]ormat')
map('n', '<leader>cr', vim.lsp.buf.rename, 'LSP: [c]ode [r]ename')

map('n', '<leader>cd', function()
  require('neogen').generate()
end, '[c]ode [d]oc Comment')

-- Git
map('n', '<leader>gb', '<cmd>Gitsigns toggle_current_line_blame<cr>', 'Git: [b]lame (toggle)')
map('n', '<leader>gD', '<cmd>Gitsigns toggle_deleted<cr>', 'Git: [D]eleted (toggle)')

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, 'Go to previous [d]iagnostic message')
map('n', ']d', vim.diagnostic.goto_next, 'Go to next [d]iagnostic message')
map('n', '<leader>ee', vim.diagnostic.open_float, 'Show diagnostic [e]rror messages')
map('n', '<leader>eq', vim.diagnostic.setloclist, 'Open diagnostic [q]uickfix list')

map('n', '<leader>en', function()
  require('trouble').next { mode = 'diagnostics', jump = true, skip_groups = true }
end, 'Trouble: Jump to [n]ext issue')

map('n', '<leader>ep', function()
  require('trouble').prev { mode = 'diagnostics', jump = true, skip_groups = true }
end, 'Trouble: Jump to [p]revious issue')

-- Search
map('n', '<leader>sh', '<cmd>Telescope help_tags<cr>', '[s]earch [h]elp')
map('n', '<leader>sk', '<cmd>Telescope keymaps<cr>', '[s]earch [k]eymaps')
map('n', '<leader>sf', '<cmd>Telescope find_files<cr>', '[s]earch [f]iles')
map('n', '<leader>ss', '<cmd>Telescope builtin<cr>', '[s]earch [s]elect Telescope')
map('n', '<leader>sw', '<cmd>Telescope grep_string<cr>', '[s]earch current [w]ord')
map('n', '<leader>sg', '<cmd>Telescope live_grep<cr>', '[s]earch by [g]rep')
map('n', '<leader>sd', '<cmd>Telescope diagnostics<cr>', '[s]earch [d]iagnostics')
map('n', '<leader>sr', '<cmd>Telescope resume<cr>', '[s]earch [r]esume')
map('n', '<leader>s.', '<cmd>Telescope oldfiles<cr>', '[s]earch Recent Files ("." for repeat)')
map('n', '<leader><leader>', '<cmd>Telescope buffers<cr>', '[ ] Find existing buffers')

map('n', '<leader>s/', function()
  require('telescope.builtin').live_grep { grep_open_files = true, prompt_title = 'Live Grep in Open Files' }
end, '[s]earch [/] in Open Files')

map('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { winblend = 10, previewer = false })
end, '[/] Fuzzily search in current buffer')

map('n', '<leader>sn', function()
  require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
end, '[s]earch [n]eovim files')

-- Markdown
map('n', '<leader>ml', '<cmd>MarkdownPreview<cr>', '[m]arkdown [l]ive preview')
map('n', '<leader>ms', '<cmd>MarkdownPreviewStop<cr>', '[m]arkdown preview [s]top')
map('n', '<leader>mL', '<cmd>MarkdownPreviewToggle<cr>', '[m]arkdown [L]ive preview toggle')
map('n', '<leader>mp', '<cmd>RenderMarkdown enable<cr>', '[m]arkdown [p]review')
map('n', '<leader>md', '<cmd>RenderMarkdown disable<cr>', '[m]arkdown [d]isable preview')
map('n', '<leader>mt', '<cmd>RenderMarkdown toggle<cr>', '[m]arkdown [t]oggle preview')

-- Folding
map('n', '<leader>fc', function()
  require('ufo').closeAllFolds()
end, '[f]old [c]lose all')

map('n', '<leader>fo', function()
  require('ufo').openAllFolds()
end, '[f]old [o]pen all')

map('n', '<leader>fp', function()
  require('ufo').peekFoldedLinesUnderCursor()
end, '[f]old [p]eek')

map('n', '<leader>f1', function()
  require('ufo').closeFoldsWith(1)
end, '[f]old level [1]')

map('n', '<leader>f2', function()
  require('ufo').closeFoldsWith(2)
end, '[f]old level [2]')

map('n', '<leader>f3', function()
  require('ufo').closeFoldsWith(3)
end, '[f]old level [3]')

map('n', '<leader>f4', function()
  require('ufo').closeFoldsWith(4)
end, '[f]old level [4]')
