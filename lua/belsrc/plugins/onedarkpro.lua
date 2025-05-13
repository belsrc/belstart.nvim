return {
  'olimorris/onedarkpro.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function()
    vim.cmd.colorscheme 'onedark'
    vim.cmd.hi 'Comment gui=none'
  end,
  opts = {
    highlights = {
      -- 40% darken of the base OneDark blue color: #61afef
      -- Visual = { bg = '#0c4778' },
      -- 30% darken of the base OneDark blue color: #61afef
      Visual = { bg = '#1163a6' },
    },
  },
}
