local function running_linters()
  local linters = require('lint').get_running()
  if #linters == 0 then
    return '󰦕 '
  end
  return '󱉶 ' .. table.concat(linters, ', ')
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    theme = 'onedark',
    sections = {
      lualine_c = { { 'filename', path = 1 } },
      lualine_x = { 'encoding' },
      lualine_y = { 'filetype', running_linters },
      lualine_z = { 'location' },
    },
  },
}
