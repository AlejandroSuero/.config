return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require "alpha"
    local dashboard = require "alpha.themes.dashboard"

    local lazy_path = vim.fn.stdpath "config" .. "/lua/aome/lazy.lua"

    -- Set header
    dashboard.section.header.val = {
      "                                        ",
      "                 青目                   ",
      "                                        ",
      "   █████╗  ██████╗ ███╗   ███╗███████╗  ",
      "  ██╔══██╗██╔═══██╗████╗ ████║██╔════╝  ",
      "  ███████║██║   ██║██╔████╔██║█████╗    ",
      "  ██╔══██║██║   ██║██║╚██╔╝██║██╔══╝    ",
      "  ██║  ██║╚██████╔╝██║ ╚═╝ ██║███████╗  ",
      "  ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝  ",
      "                                        ",
      "    󰝚 I'm Blue da ba dee da ba daa 󰝚    ",
      "                                        ",
      "                                        ",
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", ":e "),
      dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>Ex<CR>"),
      dashboard.button(
        "SPC pf",
        "󰱼  > Find File",
        "<cmd>Telescope find_files<CR>"
      ),
      dashboard.button(
        "SPC ps",
        "  > Find Word",
        "<cmd>Telescope live_grep<CR>"
      ),
      dashboard.button(
        "SPC epp",
        "󱇧  > Edit lazy.lua",
        "<cmd>e " .. lazy_path .. "<CR>"
      ),
      dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd [[autocmd FileType alpha setlocal nofoldenable]]
  end,
}
