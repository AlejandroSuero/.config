local reload_colorscheme = require("aome.core.utils").reload_colorscheme

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
      reload_colorscheme("catppuccin", "colorscheme")
    end,
    on_close = function()
      reload_colorscheme(vim.g.base46, "base46")
    end,
  },
  config = function(_, opts)
    local zen_mode = require("zen-mode")
    zen_mode.setup(opts)
  end,
  cmd = "ZenMode",
  keys = {
    { "<leader>z", "<cmd>ZenMode<cr>", desc = "Enter zen mode" },
  },
}
