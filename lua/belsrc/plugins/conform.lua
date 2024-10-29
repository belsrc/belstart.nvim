-- Not a bad thing to move to a util ?
--
-- local function first(bufnr, ...)
--   local conform = require 'conform'
--   for i = 1, select('#', ...) do
--     local formatter = select(i, ...)
--     if conform.get_formatter_info(formatter, bufnr).available then
--       return formatter
--     end
--   end
--   return select(1, ...)
-- end

return {
  'stevearc/conform.nvim',
  lazy = false,
  keys = {
    {
      '<leader>F',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = 'LSP: [F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      local disable_filetypes = { c = true, cpp = true }
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    formatters_by_ft = {
      -- Biome set
      -- javascript = { 'biome' },
      -- typescript = { 'biome' },
      -- javascriptreact = { 'biome' },
      -- typescriptreact = { 'biome' },
      -- html = { 'biome' },
      -- css = { 'biome' },
      -- json = { 'biome' },

      -- ESlint set
      javascript = { 'prettierd', 'eslint_d' },
      typescript = { 'prettierd', 'eslint_d' },
      javascriptreact = { 'prettierd', 'eslint_d' },
      typescriptreact = { 'prettierd', 'eslint_d' },
      html = { 'prettierd' },
      css = { 'prettierd' },
      json = { 'prettierd' },

      -- Others
      yaml = { 'prettierd' },
      markdown = { 'prettierd' },
      lua = { 'stylua' },
    },
  },
}
