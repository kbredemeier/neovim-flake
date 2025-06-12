if vim.g.did_load_autoformat_plugin then
  return
end

vim.g.did_load_autoformat_plugin = true

require('conform').setup {
  formatters_by_ft = {
    lua = { 'stylua' },
    nix = { 'nixfmt' },
    javascript = { 'prettierd' },
    json = { 'prettierd' },
    yaml = { 'prettierd' },
    markdown = { 'prettierd' },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = 'fallback',
  },
}
