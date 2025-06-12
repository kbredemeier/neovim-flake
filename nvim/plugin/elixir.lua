if vim.g.did_load_elixir_plugin then
  return
end

vim.g.did_load_elixir_plugin = true

local elixir = require('elixir')

elixir.setup {
  nextls = { enable = false },
  credo = { enable = false },
  elixirls = { enable = true },
}
