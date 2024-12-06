
local map = function(mode, keys, func, desc)
  vim.keymap.set(mode, keys, func, { desc = desc })
end

-- Clear highlight on search when pressing <Esc> in normal mode
map('n', '<Esc>', '<cmd>nohlsearch<cr>', 'Cancel')

-- Insert Moving
map('i', '<C-e>', '<End>', 'Move End of Line')
map('i', '<C-h>', '<Left>', 'Move Left')
map('i', '<C-l>', '<Right>', 'Move Right')
map('i', '<C-j>', '<Down>', 'Move Down')
map('i', '<C-k>', '<Up>', 'Move Up')

-- Highlight Moving. Allows you to move selected text
map('v', 'J', ":m '>+1<cr>gv=gv")
map('v', 'K', ":m '<-2<cr>gv=gv")

-- Don't yank on certain actions
map('n', 'x', '"_x')
map('n', 'X', '"_X')
map('v', 'x', '"_x')
map('v', 'X', '"_X')
map('v', 'p', '"_dP')

-- Wrapping selection
map('n', '<leader>w{', 'viwc{}<esc>P', 'Wrap: Word with {}')
map('n', '<leader>w[', 'viwc[]<esc>P', 'Wrap: Word with []')
map('n', '<leader>w(', 'viwc()<esc>P', 'Wrap: Word with ()')
map('n', "<leader>w'", "viwc''<esc>P", "Wrap: Word with ''")
map('n', '<leader>w"', 'viwc""<esc>P', 'Wrap: Word with ""')
map('n', '<leader>w`', 'viwc``<esc>P', 'Wrap: Word with ``')
map('v', '<leader>w{', 'c{}<esc>P', 'Wrap: With {}')
map('v', '<leader>w[', 'c[]<esc>P', 'Wrap: With []')
map('v', '<leader>w(', 'c()<esc>P', 'Wrap: With ()')
map('v', "<leader>w'", "c''<esc>P", "Wrap: With ''")
map('v', '<leader>w"', 'c""<esc>P', 'Wrap: With ""')
map('v', '<leader>w`', 'c``<esc>P', 'Wrap: With ``')

-- Keep cursor in the middle of screen when half jumping
map('n', '<C-d>', '<C-d>zz', 'Page down')
map('n', '<C-u>', '<C-u>zz', 'Page up')
map('n', 'G', 'Gzz', 'Last line')

-- Go to
map('n', 'gD', vim.lsp.buf.declaration, 'LSP: Go to [D]eclaration')

if vim.fn.has 'macunix' == 1 then
  map('n', 'gx', "<cmd>silent execute '!open ' . shellescape('<cWORD>')<CR>", 'Go to link')
else
  map('n', 'gx', "<cmd>silent execute '!xdg-open ' . shellescape('<cWORD>')<CR>", 'Go to link')
end

-- Buffers
map('n', '<leader>bn', '<cmd>bnext<cr>', 'Buffer: [n]ext')
map('n', '<leader>bp', '<cmd>bprevious<cr>', 'Buffer: [p]revious')
map('n', '<leader>bf', '<cmd>bfirst<cr>', 'Buffer: [f]irst')
map('n', '<leader>bL', '<cmd>blast<cr>', 'Buffer: [L]ast')
map('n', '<leader>bd', '<cmd>bd<cr>', 'Buffer: [d]elete')
map('n', '<leader>bD', '<cmd>%bd<cr><C-O><cmd>bd#<cr>', 'Buffer: [D]elete All to Current')
map('n', '<leader>bl', '<cmd>ls<cr>', 'Buffer: [l]ist')
map('n', '<leader>bN', '<cmd>enew<cr>', 'Buffer: [N]ew')
map('n', '<leader>bw', '<cmd>bwipeout!<cr>', 'Buffer: [w]ipeout')

-- Windows
map('n', '<C-h>', '<C-w><C-h>', 'Window: Move to left window')
map('n', '<C-l>', '<C-w><C-l>', 'Window: Move to right window')
map('n', '<C-j>', '<C-w><C-j>', 'Window: Move to lower window')
map('n', '<C-k>', '<C-w><C-k>', 'Window: Move to upper window')

-- Sessions
map('n', '<leader>Sr', '<cmd>SessionRestore<cr>', 'Session: [r]estore')
map('n', '<leader>Ss', '<cmd>SessionSave<cr>', 'Session: [s]ave')

-- Explorer
map('n', '<leader>pn', vim.cmd.Ex, 'Project: [n]etrw')
map('n', '<leader>py', '<cmd>Yazi<cr>', 'Project: [y]azi')

-- Restarts
map('n', '<leader>rl', '<cmd>LspRestart<cr>', 'Restart: [l]sp')
map('n', '<leader>rc', '<cmd>source %MYVIMRC<cr>', 'Restart: Neovim [c]config')

-- Code
map('n', '<leader>cf', vim.lsp.buf.format, 'LSP: [f]ormat buffer')
map('n', '<leader>cr', vim.lsp.buf.rename, 'LSP: [r]ename symbol')
map('n', '<leader>ca', vim.lsp.buf.code_action, 'LSP: [a]ctions')

map('n', '<leader>cd', function()
  require('neogen').generate()
end, '[c]ode [d]oc Comment')

-- Display
map('n', '<leader>H', vim.lsp.buf.hover, 'LSP: [H]over Documentation')
map('n', '<leader>G', vim.lsp.buf.signature_help, 'LSP: Show Si[G]nature')

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, 'Diagnostics: Go to previous message')
map('n', ']d', vim.diagnostic.goto_next, 'Diagnostics: Go to next message')
map('n', '<leader>ee', vim.diagnostic.open_float, 'Diagnostics: Show [e]rror messages')
map('n', '<leader>ex', vim.diagnostic.setloclist, 'Diagnostics: Open e[x]tra quickfix list')
map('n', '<leader>et', '<cmd>Trouble todo toggle<CR>', 'Diagnostics: Open [t]odos list')
map('n', '<leader>eq', '<cmd>Trouble diagnostics toggle<CR>', 'Diagnostics: Open [q]uickfix list')

map('n', '<leader>en', function()
  require('trouble').next { mode = 'diagnostics', jump = true, skip_groups = true }
end, 'Diagnostics: Jump to [n]ext issue')

map('n', '<leader>ep', function()
  require('trouble').prev { mode = 'diagnostics', jump = true, skip_groups = true }
end, 'Diagnostics: Jump to [p]revious issue')

-- Debugging
map('n', '<F5>', function()
  require('dap').continue()
end, 'Debug: Start/Continue')

map('n', '<F1>', function()
  require('dap').step_into()
end, 'Debug: Step Into')

map('n', '<F2>', function()
  require('dap').step_over()
end, 'Debug: Step Over')

map('n', '<F3>', function()
  require('dap').step_out()
end, 'Debug: Step Out')

map('n', '<leader>ct', function()
  require('dap').toggle_breakpoint()
end, 'Debug: Toggle break[p]oint')

map('n', '<leader>cB', function()
  require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end, 'Debug: Set code [B]reakpoint')

-- Git
map('n', '<leader>gb', '<cmd>Gitsigns toggle_current_line_blame<cr>', 'Git: Toggle [b]lame')
map('n', '<leader>gD', '<cmd>Gitsigns toggle_deleted<cr>', 'Git: Toggle [D]eleted')

-- Search
map('n', '<leader>sh', '<cmd>Telescope help_tags<cr>', 'Search: [h]elp')
map('n', '<leader>sk', '<cmd>Telescope keymaps<cr>', 'Search: [k]eymaps')
map('n', '<leader>sf', '<cmd>Telescope find_files<cr>', 'Search: [f]iles')
map('n', '<leader>ss', '<cmd>Telescope builtin<cr>', 'Search: [s]elect Telescope')
map('n', '<leader>sw', '<cmd>Telescope grep_string<cr>', 'Search: current [w]ord')
map('n', '<leader>sg', '<cmd>Telescope live_grep<cr>', 'Search: With [g]rep')
map('n', '<leader>sd', '<cmd>Telescope diagnostics<cr>', 'Search: [d]iagnostics')
map('n', '<leader>sr', '<cmd>Telescope resume<cr>', 'Search: [r]esume')
map('n', '<leader>s.', '<cmd>Telescope oldfiles<cr>', 'Search: Recent Files ("." for repeat)')
map('n', '<leader><leader>', '<cmd>Telescope buffers<cr>', 'Search: Existing buffers')

map('n', '<leader>s/', function()
  require('telescope.builtin').live_grep { grep_open_files = true, prompt_title = 'Live Grep in Open Files' }
end, 'Search: In open buffers')

map('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { winblend = 10, previewer = false })
end, 'Search: Fuzzily in current buffer')

map('n', '<leader>sn', function()
  require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
end, 'Search: [n]eovim files')

-- Markdown
map('n', '<leader>ml', '<cmd>MarkdownPreview<cr>', 'Markdown: [l]ive preview')
map('n', '<leader>ms', '<cmd>MarkdownPreviewStop<cr>', 'Markdown: Preview [s]top')
map('n', '<leader>mL', '<cmd>MarkdownPreviewToggle<cr>', 'Markdown: [L]ive preview toggle')
map('n', '<leader>mp', '<cmd>RenderMarkdown enable<cr>', 'Markdown: [p]review')
map('n', '<leader>md', '<cmd>RenderMarkdown disable<cr>', 'Markdown: [d]isable preview')
map('n', '<leader>mt', '<cmd>RenderMarkdown toggle<cr>', 'Markdown: [t]oggle preview')

-- Folding
map('n', '<leader>fc', function()
  require('ufo').closeAllFolds()
end, 'Fold: [c]lose all')

map('n', '<leader>fo', function()
  require('ufo').openAllFolds()
end, 'Fold: [o]pen all')

map('n', '<leader>fp', function()
  require('ufo').peekFoldedLinesUnderCursor()
end, 'Fold: [p]eek')

map('n', '<leader>f1', function()
  require('ufo').closeFoldsWith(1)
end, 'Fold: Level [1]')

map('n', '<leader>f2', function()
  require('ufo').closeFoldsWith(2)
end, 'Fold: Level [2]')

map('n', '<leader>f3', function()
  require('ufo').closeFoldsWith(3)
end, 'Fold: Level [3]')

map('n', '<leader>f4', function()
  require('ufo').closeFoldsWith(4)
end, 'Fold: Level [4]')
