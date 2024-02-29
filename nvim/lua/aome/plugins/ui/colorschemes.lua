local configs = "aome.plugins.ui.configs."
return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = require(configs .. "kanagawa"),
  },
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    name = "catppuccin",
    opts = require(configs .. "catppuccin"),
  },
  {
    "neanias/everforest-nvim",
    lazy = false,
    priority = 1000,
    opts = require(configs .. "everforest"),
    config = function(_, opts)
      require("everforest").setup(opts)
    end,
  },
  {
    "olivercederborg/poimandres.nvim",
    lazy = false,
    priority = 1000,
    opts = require(configs .. "poimandres"),
    config = function(_, opts)
      require("poimandres").setup(opts)
    end,
  },
}
