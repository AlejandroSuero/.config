local load_colorscheme = function()
  local colorscheme
  if vim.g.theme == "base46" then
    colorscheme = vim.g.base46
  else
    colorscheme = vim.g.colorscheme
  end
  require("aome.core.utils").reload_colorscheme(colorscheme)
end

return {
  "folke/zen-mode.nvim",
  lazy = true,
  opts = {
    window = {
      width = math.floor((vim.o.columns / 2) + 20),
      backdrop = 0.50,
      options = {
        cursorline = true,
      },
      plugins = {
        gitsigns = { enabled = false },
        options = {
          laststatus = 3,
        },
      },
    },
    on_open = function(_)
      load_colorscheme()
    end,
    on_close = function()
      load_colorscheme()
    end,
  },
  config = function(_, opts)
    local zen_mode = require "zen-mode"
    zen_mode.setup(opts)
  end,
  cmd = "ZenMode",
  keys = {
    { "<leader>zz", "<cmd>ZenMode<cr>", desc = "Enter zen mode" },
  },
}
