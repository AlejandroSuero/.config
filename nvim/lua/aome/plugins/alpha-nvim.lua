return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- Set header
        dashboard.section.header.val = {
            "                                        ",
            "                                        ",
            "                                        ",
            "                                        ",
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
            "                                        ",
            "                                        ",
        }

        -- Set menu
        dashboard.section.buttons.val = {
<<<<<<< HEAD
            dashboard.button("e", "  > New File", ":e "),
=======
            dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
>>>>>>> origin/main
            dashboard.button(
                "SPC ee",
                "  > Toggle file explorer",
                "<cmd>NvimTreeToggle<CR>"
            ),
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
                "<cmd>e ~/.config/nvim/lua/aome/lazy.lua <CR>"
            ),
            dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
        }

        -- Send config to alpha
        alpha.setup(dashboard.opts)

        -- Disable folding on alpha buffer
        vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    end,
}
