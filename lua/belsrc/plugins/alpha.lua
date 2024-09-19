return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    -- Header
    dashboard.section.header.val = {
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
    }

    -- dashboard.section.header.opts.hl = { { 'AlphaNeovimLogoBlue', 0, 0 } }

    _Gopts = {
      position = 'center',
      hl = 'Type',
      -- wrap = "overflow";
    }

    -- Set Menu
    dashboard.section.buttons.val = {
      dashboard.button('SPC j', '   Restore Session', '<cmd>SessionRestore<cr>'),
      dashboard.button('e', '   New file', '<cmd>ene<CR>'),
      dashboard.button('r', '   Recent', '<cmd>Telescope oldfiles<CR>'),
      dashboard.button('f', '󰥨   Find file', '<cmd>Telescope find_files<CR>'),
      dashboard.button('g', '󰱼   Find text', '<cmd>Telescope live_grep<CR>'),
      dashboard.button('p', '   Projects', '<cmd>Telescope projects<CR>'),
      dashboard.button('c', '   Config', '<cmd>e $MYVIMRC <CR>'),
      dashboard.button('m', '󱌣   Mason', '<cmd>Mason<CR>'),
      dashboard.button('l', '󰒲   Lazy', '<cmd>Lazy<CR>'),
      dashboard.button('u', '󰂖   Update plugins', "<cmd>lua require('lazy').sync()<CR>"),
      dashboard.button('q', '   Quit NVIM', '<cmd>qa<CR>'),
    }

    -- Footer load times
    vim.api.nvim_create_autocmd('User', {
      callback = function()
        local stats = require('lazy').stats()
        local ms = math.floor(stats.startuptime * 100) / 100
        dashboard.section.footer.val = '󱐌 Lazy-loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms'
        pcall(vim.cmd.AlphaRedraw)
      end,
    })

    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)
  end,
}
