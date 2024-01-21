return {
  {
    "wuelnerdotexe/vim-enfocado",
    priority = 1000,
    lazy = false,
    init = function()
      vim.g.enfocado_style = "neon"
    end,
  },
  {
    "bluz71/vim-nightfly-guicolors",
    priority = 1000, -- make sure to load this before all the other start plugins
    lazy = false,
  },
  {
    "catppuccin/nvim",
    priority = 1000,
    name = "catppuccin",
    lazy = false,
    opts = require("aome.plugins.ui.colorschemes.catppuccin").options,
  },
  {
    "rose-pine/neovim",
    priority = 1000,
    name = "rose-pine",
    lazy = false,
    opts = require("aome.plugins.ui.colorschemes.rose-pine").options,
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = require("aome.plugins.ui.colorschemes.solarized-osaka").options,
  },
}
