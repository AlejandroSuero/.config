local M = {}

local transparent_value = 0

if vim.g.transparency then
  transparent_value = 2
end

M.options = {
  transparent_background_level = transparent_value,
  dim_inactive_windows = true,
  float_style = "dim",
}

M.colors = {
  bg = "#333c43",
}

return M
