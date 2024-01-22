local hsl = require("aome.core.utils").hslToHex
local M = {}

M.options = {
  transparent = vim.g.transparency,
  terminal_colors = true,
  styles = {
    comments = { italic = false },
    keywords = { italic = false },
    floats = "normal",
  },
}

M.colors = {
  bg = hsl(192, 100, 5),
}

return M
