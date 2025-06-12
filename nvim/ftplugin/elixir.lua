local builtin = require('telescope.builtin')
local set = vim.keymap.set

local find_in = function(dir)
  return function()
    builtin.find_files { search_dirs = { dir } }
  end
end

set('n', '<leader>sfl', find_in('lib'), { desc = '[S]earch [F]iles in [L]ib' })
set('n', '<leader>sft', find_in('test'), { desc = '[S]earch [F]iles in [T]est' })
set('n', '<leader>sfc', find_in('config'), { desc = '[S]earch [F]iles in [C]config' })
set('n', '<leader>sfa', find_in('assets'), { desc = '[S]earch [F]iles in [A]ssets' })

if vim.fn.executable('elixir-ls') ~= 1 then
  return
end

local elixirls = require('elixir.elixirls')

local on_attach = function()
  set('n', '<space>fp', ':ElixirFromPipe<cr>', { buffer = true, noremap = true })
  set('n', '<space>tp', ':ElixirToPipe<cr>', { buffer = true, noremap = true })
  set('v', '<space>em', ':ElixirExpandMacro<cr>', { buffer = true, noremap = true })
end

local root_files = {
  'mix.exs',
  '.git',
}

vim.lsp.start {
  name = 'elixir-ls',
  cmd = { 'elixir-ls' },
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  capabilities = require('user.lsp').make_client_capabilities(),
  on_attach = on_attach,
  settings = elixirls.settings {
    dialyzerEnabled = true,
    fetchDeps = false,
    enableTestLenses = true,
    suggestSpecs = true,
  },
}
