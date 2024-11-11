-- Utility function to check if a file exists in the current project directory
local function file_exists(name)
  return vim.fn.filereadable(vim.fn.getcwd() .. '/' .. name) == 1
end

-- Autocommand to set up linters based on the presence of config files
local lint = require 'lint'
vim.api.nvim_create_autocmd({ 'BufEnter', 'DirChanged' }, {
  callback = function()
    lint.linters_by_ft = lint.linters_by_ft or {}

    -- Javascript: Default to ESLint as in mono's, config isnt at root
    -- if file_exists('.eslintrc.js') or file_exists('.eslintrc.json') then
    if file_exists 'biome.json' then
      lint.linters_by_ft.javascript = { 'biomejs' }
      lint.linters_by_ft.typescript = { 'biomejs' }
      lint.linters_by_ft.javascriptreact = { 'biomejs' }
      lint.linters_by_ft.typescriptreact = { 'biomejs' }
      lint.linters_by_ft.json = { 'biomejs' }
    else
      lint.linters_by_ft.javascript = { 'eslint_d' }
      lint.linters_by_ft.typescript = { 'eslint_d' }
      lint.linters_by_ft.javascriptreact = { 'eslint_d' }
      lint.linters_by_ft.typescriptreact = { 'eslint_d' }
      lint.linters_by_ft.json = { 'eslint_d' }
    end

    -- Markdown: Only if rc file found. Too spammy otherwise
    if file_exists '.mdlrc' then
      lint.linters_by_ft.markdown = { 'markdownlint' }
    end

    lint.linters_by_ft.glsl = { 'glslc' }
    lint.linters_by_ft.html = { 'htmlhint' }
  end,
})

-- Autocommand to run setup whenever you enter a new buffer or change directories
local conform = require 'conform'
vim.api.nvim_create_autocmd({ 'BufEnter', 'DirChanged' }, {
  callback = function()
    local linters = {}

    -- Javascript: Default to ESLint as in mono's, config isnt at root
    -- if file_exists('.eslintrc.js') or file_exists('.eslintrc.json') then
    if file_exists 'biome.json' then
      linters['javascript'] = { 'biome' }
      linters['typescript'] = { 'biome' }
      linters['javascriptreact'] = { 'biome' }
      linters['typescriptreact'] = { 'biome' }
      linters['html'] = { 'biome' }
      linters['css'] = { 'biome' }
      linters['json'] = { 'biome' }
    else
      linters['javascript'] = { 'prettierd', 'eslint_d' }
      linters['typescript'] = { 'prettierd', 'eslint_d' }
      linters['javascriptreact'] = { 'prettierd', 'eslint_d' }
      linters['typescriptreact'] = { 'prettierd', 'eslint_d' }
      linters['html'] = { 'prettierd' }
      linters['css'] = { 'prettierd' }
      linters['json'] = { 'prettierd' }
    end

    linters['yaml'] = { 'prettierd' }
    linters['markdown'] = { 'prettierd' }
    linters['lua'] = { 'stylua' }

    -- Reconfigure Conform with the detected linters
    conform.setup {
      formatters_by_ft = linters,
    }
  end,
})
