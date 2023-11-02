return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = function()
        local ok, nvimtree = pcall(require, "nvim-tree")
        if not ok then
            vim.notify("NvimTree is not loaded", 3)
            return
        end

        local on_attach = function(bufnr)
            local api = require("nvim-tree.api")
            api.config.mappings.default_on_attach(bufnr)
            vim.opt.cursorline = true
        end

        -- recommended settings from nvim-tree documentation
        -- disables netrw
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- configure nvim-tree
        nvimtree.setup({
            on_attach = on_attach,
            view = {
                width = 40,
                number = false,
                side = "right",
            },
            -- change folder arrow icons
            renderer = {
                indent_markers = {
                    enable = true,
                },
                icons = {
                    glyphs = {
                        folder = {
                            arrow_closed = "", -- arrow when folder is closed
                            arrow_open = "", -- arrow when folder is open
                        },
                        git = {
                            unstaged = "✗",
                            staged = "✓",
                            unmerged = "",
                            renamed = "➜",
                            untracked = "",
                            deleted = "󰗨",
                        },
                        symlink = "󱅸",
                    },
                },
            },
            -- disable window_picker for
            -- explorer to work well with
            -- window splits
            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    },
                    quit_on_open = true,
                },
            },
            filters = {
                exclude = { ".DS_Store", "node_modules", ".git" },
                dotfiles = false,
            },
            git = {
                ignore = false,
            },
        })

        -- set keymaps
        local mappings = {
            n = {
                ["<leader>ee"] = {
                    vim.cmd.NvimTreeToggle,
                    "NvimTree toggle",
                },
                ["<leader>ef"] = {
                    vim.cmd.NvimTreeFocus,
                    "NvimTree focus",
                },
                ["<leader>ec"] = {
                    vim.cmd.NvimTreeCollapse,
                    "NvimTree collapse",
                },
                ["<leader>er"] = { vim.cmd.NvimTreeRefresh, "NvimTree refresh" },
            },
        }

        require("aome.core.utils").map_keys(mappings)
    end,
}
