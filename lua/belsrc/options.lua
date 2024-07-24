local opt = vim.opt
local global = vim.g

global.mapleader = ' '
global.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
global.have_nerd_font = true

-- Adjust some netrw things
global.netrw_browse_split = 0
global.netrw_banner = 0
global.netrw_winsize = 25

-- Tabs and Indentation
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.autoindent = true

-- Make line numbers default
opt.number = true
opt.relativenumber = true

-- Turn off line wrap
-- opt.wrap = false

-- Enable mouse mode, can be useful for resizing splits for example!
opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
opt.showmode = false

-- Sync clipboard between OS and Neovim.
opt.clipboard = 'unnamedplus'

-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true
opt.smartcase = true

-- Keep signcolumn on by default
opt.signcolumn = 'yes'

-- Decrease update time
opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
opt.timeoutlen = 300

-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
opt.inccommand = 'split'

-- Show which line your cursor is on
opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 10

-- Set highlight on search.
opt.hlsearch = true

-- Set incremental seach
opt.incsearch = true

-- Colors
opt.termguicolors = true

-- Set update time
opt.updatetime = 100

-- Turn off swapfile
opt.swapfile = false

-- Turn off backup
opt.backup = false

-- Options needed for UFO folding
opt.foldcolumn = '1'
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
