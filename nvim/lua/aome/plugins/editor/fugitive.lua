return {
  "tpope/vim-fugitive",
  lazy = true,
  cmd = { "G", "Git" },
  keys = {
    { "<leader>gs", "<cmd>tab Git<cr>", desc = "Git status" },
    { "<leader>gcm", "<cmd>Git commit<cr>", desc = "Git commit" },
    { "<leader>gf", "<cmd>Git fetch --all -p<cr>", desc = "Git fetch" },
    { "<leader>gp", "<cmd>Git pull<cr>", desc = "Git pull" },
    { "<leader>gP", "<cmd>Git push<cr>", desc = "Git push" },
    {
      "<leader>gu",
      "<cmd>Git push origin ",
      desc = "Git push origin <branch>",
    },
  },
}
