local function first(bufnr, ...)
  local conform = require 'conform'
  for i = 1, select('#', ...) do
    local formatter = select(i, ...)
    if conform.get_formatter_info(formatter, bufnr).available then
      return formatter
    end
  end
  return select(1, ...)
end

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
      lua = { 'stylua' },
      javascript = function(bufnr)
        return { first(bufnr, 'biome', 'prettierd', 'prettier'), first(bufnr, 'biome', 'eslintd') }
      end,
      typescript = function(bufnr)
        return { first(bufnr, 'biome', 'prettierd', 'prettier'), first(bufnr, 'biome', 'eslintd') }
      end,
      javascriptreact = function(bufnr)
        return { first(bufnr, 'biome', 'prettierd', 'prettier'), first(bufnr, 'biome', 'eslintd') }
      end,
      typescriptreact = function(bufnr)
        return { first(bufnr, 'biome', 'prettierd', 'prettier'), first(bufnr, 'biome', 'eslintd') }
      end,
      html = function(bufnr)
        return { first(bufnr, 'biome', 'prettierd', 'prettier') }
      end,
      css = function(bufnr)
        return { first(bufnr, 'biome', 'prettierd', 'prettier') }
      end,
      json = function(bufnr)
        return { first(bufnr, 'biome', 'prettierd', 'prettier') }
      end,
      yaml = { { 'prettierd', 'prettier' } },
      markdown = { { 'prettierd', 'prettier' } },
    },
  },
}
