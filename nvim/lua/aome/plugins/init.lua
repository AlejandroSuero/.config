return {
  "nvim-lua/plenary.nvim",
  {
    "laytan/cloak.nvim",
    event = "VeryLazy",
    config = function()
      local ok, cloak = pcall(require, "cloak")
      if not ok then
        vim.notify("Cloak is not loaded", vim.log.levels.WARN)
        return
      end
      cloak.setup {
        enabled = true,
        cloack_character = "",
        highlight_group = "Comment",
        patterns = {
          {
            file_pattern = {
              ".env*",
              "wrangler.toml",
              ".dev.vars",
            },
            cloak_pattern = "=.+",
          },
        },
      }
    end,
  },
}
