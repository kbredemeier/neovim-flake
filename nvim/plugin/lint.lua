if vim.g.did_load_lint_plugin then
  return
end
vim.g.did_load_lint_plugin = true

local lint = require('lint')

lint.linters_by_ft = {
  markdown = { 'vale' },
  text = { 'vale' },
  sh = { 'shellcheck' },
}

local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  group = lint_augroup,
  callback = function()
    require('lint').try_lint()
  end,
})
