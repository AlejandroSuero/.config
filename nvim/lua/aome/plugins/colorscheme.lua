return {
    {
        "catppuccin/nvim",
        priority = 1000,
        lazy = false,
        name = "catppuccin",
        config = function()
            local ok, catppuccin = pcall(require, "catppuccin")
            if not ok then
                vim.notify("COLORSCHEME: catppuccin is not installed", 3)
                return
            end

            catppuccin.setup({
                transparent_background = true,
                term_colors = true,
                dim_inactive = {
                    enabled = true,
                    percentage = 0.5,
                },
                styles = {
                    conditionals = {},
                },
                integrations = {
                    treesitter = true,
                    native_lsp = {
                        enable = false,
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
                        style = "nvchad"
                    },
                    markdown = true,
                    mason = true,
                    harpoon = true,
                    bufferline = true,
                    telescope = true,
                    markdown = true,
                    mason = true,
                    harpoon = true,
                },
            })
            vim.cmd.colorscheme(vim.g.colorscheme)
        end,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = true,
        config = function()
            local ok, rosepine = pcall(require, "rose-pine")
            if not ok then
                vim.notify("COLORSCHEME: rose-pine not installed", 3)
                return
            end

            rosepine.setup({
                disable_background = true,
            })
            vim.cmd.colorscheme(vim.g.colorscheme)
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        opts = {
            style = "night",
            light_style = "storm",
            transparent = vim.g.transparency,
            term_colors = true,
            styles = {
                comments = { italic = false },
                keywords = { italic = false, bold = true },
                sidebars = "dark",
                floats = "dark"
            },
            sidebars = { "nvim-tree", "NvimTree" },
            dim_inactive = true
        },
        config = function(_, opts)
            local ok, tokyonight = pcall(require, "tokyonight")
            if not ok then
                vim.notify("COLORSCHEME: tokyonight not installed", 4)
                return
            end
            tokyonight.setup(opts)
        end
    }
}
