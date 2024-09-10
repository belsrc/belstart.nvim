return {
  'echasnovski/mini.nvim',
  -- Collection of various small independent plugins/modules
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}
