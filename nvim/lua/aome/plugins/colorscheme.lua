return {
    {
        "catppuccin/nvim",
        priority = 1000,
        lazy = false,
        name = "catppuccin",
        opts = {
            transparent_background = vim.g.transparency,
            term_colors = true,
            dim_inactive = {
                enabled = true,
                percentage = 0.5,
            },
            highliight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            styles = {
                conditionals = {},
            },
            integrations = {
                treesitter = true,
                native_lsp = {
                    enable = true,
                    virtual_text = {
                        errors = { "italic" },
                        information = { "italic" },
                        hints = { "italic" },
                        warnings = { "italic" },
                    },
                    underlines = {
                        errors = { "underline" },
                        information = { "underline" },
                        hints = { "underline" },
                        warnings = { "underline" },
                    },
                },
                nvimtree = true,
                noice = true,
                notify = true,
                lsp_trouble = false,
                cmp = true,
                gitsigns = true,
                telescope = {
                    enabled = true,
                    style = "nvchad",
                },
                markdown = true,
                mason = true,
                harpoon = true,
                bufferline = true,
            },
            highlight_overrides = {
                all = function(_)
                    local colors = require("aome.colorschemes.catppuccin")
                    return {
                        CursorLine = { bg = colors.darker_black },
                        ColorColumn = { bg = colors.darker_black },
                    }
                end,
            },
            compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
        },
        config = function(_, opts)
            local ok, catppuccin = pcall(require, "catppuccin")
            if not ok then
                vim.notify("COLORSCHEME: catppuccin is not installed", 3)
                return
            end

            catppuccin.setup(opts)
            vim.cmd.colorscheme(vim.g.colorscheme)
        end,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = true,
        opts = {
            disable_background = vim.g.transparency,
        },
        config = function(_, opts)
            local ok, rosepine = pcall(require, "rose-pine")
            if not ok then
                vim.notify("COLORSCHEME: rose-pine not installed", 3)
                return
            end

            rosepine.setup(opts)
            vim.cmd.colorscheme(vim.g.colorscheme)
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = true,
        opts = {
            style = "night",
            light_style = "storm",
            transparent = vim.g.transparency,
            term_colors = true,
            styles = {
                comments = { italic = false },
                keywords = { italic = false, bold = true },
                sidebars = "dark",
                floats = "dark",
            },
            sidebars = { "nvim-tree", "NvimTree" },
            dim_inactive = true,
        },
        config = function(_, opts)
            local ok, tokyonight = pcall(require, "tokyonight")
            if not ok then
                vim.notify("COLORSCHEME: tokyonight not installed", 4)
                return
            end
            tokyonight.setup(opts)
            vim.cmd.colorscheme(vim.g.colorscheme)
        end,
    },
}
