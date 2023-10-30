---@diagnostic disable: undefined-global
return {
    "folke/zen-mode.nvim",
    lazy = true,
    opts = {
        window = {
            width = math.floor((vim.o.columns / 2) + 10),
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
        on_open = function(win)
            local colorscheme = "rose-pine-main"
            vim.cmd.colorscheme(colorscheme)
        end,
        on_close = function()
            vim.cmd.colorscheme(vim.g.colorscheme)
        end,
    },
    config = function(_, opts)
        local zen_mode = require("zen-mode")
        local map_keys = require("aome.core.utils").map_keys
        zen_mode.setup(opts)

        local mappings = {
            n = {
                ["<leader>zz"] = {
                    zen_mode.toggle,
                    "Toggle ZenMode",
                },
            },
        }
        map_keys(mappings)
    end,
    keys = {
        "<leader>azm",
        "<cmd>ZenMode<cr>",
        desc = "ZenMode",
    },
}
