require("aome.core.options")
require("aome.core.keymaps")
require("aome.globals")
require("aome.highlights")
require("aome.core.colorscheme")
require("aome.lazy")

if vim.g.theme == "base46" then
  require("base46").load_theme({
    theme = vim.g.base46,
    transparency = vim.g.transparency
  })
else
  vim.cmd.colorscheme(vim.g.colorscheme)
end
