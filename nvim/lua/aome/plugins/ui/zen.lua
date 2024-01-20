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
      require("base46").load_theme {
        theme = "rosepine",
        tranparency = false,
      }
    end,
    on_close = function()
      require("aome.core.utils").reload_colorscheme(vim.g.colorscheme)
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
