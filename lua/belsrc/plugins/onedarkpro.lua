return {
  'olimorris/onedarkpro.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function()
    vim.cmd.colorscheme 'onedark'
    vim.cmd.hi 'Comment gui=none'
  end,
}