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
    lazy = false
  }
}
