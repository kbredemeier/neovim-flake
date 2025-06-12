if vim.g.did_load_ibl_plugin then
  return
end
vim.g.did_load_ibl_plugin = true

local api = vim.api

local highlight = {
  'RainbowRed',
  'RainbowYellow',
  'RainbowBlue',
  'RainbowOrange',
  'RainbowGreen',
  'RainbowViolet',
  'RainbowCyan',
}

local hooks = require('ibl.hooks')
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  api.nvim_set_hl(0, 'RainbowRed', { fg = '#E06C75' })
  api.nvim_set_hl(0, 'RainbowYellow', { fg = '#E5C07B' })
  api.nvim_set_hl(0, 'RainbowBlue', { fg = '#61AFEF' })
  api.nvim_set_hl(0, 'RainbowOrange', { fg = '#D19A66' })
  api.nvim_set_hl(0, 'RainbowGreen', { fg = '#98C379' })
  api.nvim_set_hl(0, 'RainbowViolet', { fg = '#C678DD' })
  api.nvim_set_hl(0, 'RainbowCyan', { fg = '#56B6C2' })
end)
