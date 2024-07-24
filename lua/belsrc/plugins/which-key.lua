return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  config = function()
    require('which-key').setup()

    require('which-key').register {
      ['<leader>b'] = { name = ' [b]uffer', _ = 'which_key_ignore' },
      ['<leader>c'] = { name = ' [c]ode', _ = 'which_key_ignore' },
      ['<leader>d'] = { name = ' [d]ocument', _ = 'which_key_ignore' },
      ['<leader>e'] = { name = ' [e]rror', _ = 'which_key_ignore' },
      ['<leader>f'] = { name = ' [f]olding', _ = 'which_key_ignore' },
      ['<leader>g'] = { name = ' [g]it', _ = 'which_key_ignore' },
      ['<leader>m'] = { name = ' [m]arkdown', _ = 'which_key_ignore' },
      ['<leader>p'] = { name = ' [p]roject', _ = 'which_key_ignore' },
      ['<leader>s'] = { name = ' [s]earch', _ = 'which_key_ignore' },
      ['<leader>S'] = { name = '[S]ession', _ = 'which_key_ignore' },
      ['<leader>t'] = { name = ' [t]oggle', _ = 'which_key_ignore' },
    }
  end,
}
