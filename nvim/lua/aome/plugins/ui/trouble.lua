return {
  "folke/trouble.nvim",
  enabled = true,
  dependencies = "nvim-tree/nvim-web-devicons",
  cmd = "TroubleToggle",
  keys = {
    {
      "<leader><leader>t",
      "<cmd>TroubleToggle<cr>",
      desc = "Trouble toggle",
    },
  },
  config = true,
}
