return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    theme = 'onedark',
    sections = {
      lualine_c = { { 'filename', path = 1 } },
      lualine_x = { 'encoding' },
      lualine_y = { 'filetype' },
      lualine_z = { 'location' },
    },
  },
}
