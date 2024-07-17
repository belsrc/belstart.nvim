return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  config = function()
    require('which-key').setup()

    require('which-key').register {
      ['<leader>b'] = { name = ' [B]uffer', _ = 'which_key_ignore' },
      ['<leader>c'] = { name = ' [C]ode', _ = 'which_key_ignore' },
      ['<leader>d'] = { name = ' [D]ocument', _ = 'which_key_ignore' },
      ['<leader>e'] = { name = ' [E]rror', _ = 'which_key_ignore' },
      ['<leader>g'] = { name = ' [G]it', _ = 'which_key_ignore' },
      ['<leader>m'] = { name = ' [M]arkdown', _ = 'which_key_ignore' },
      ['<leader>p'] = { name = ' [P]roject', _ = 'which_key_ignore' },
      ['<leader>s'] = { name = ' [S]earch', _ = 'which_key_ignore' },
      ['<leader>S'] = { name = '[S]ession', _ = 'which_key_ignore' },
      ['<leader>t'] = { name = ' [T]oggle', _ = 'which_key_ignore' },
    }
  end,
}
