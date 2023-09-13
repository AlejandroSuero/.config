return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "User DirOpened",
    lazy = false,
    config = function()
        local ok, nvimtree = pcall(require, "nvim-tree")
        if not ok then
            vim.notify("NvimTree is not loaded", 3)
            return
        end

        -- recommended settings from nvim-tree documentation
        -- disables netrw
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- change color for arrows in tree to light blue
        vim.cmd([[ highlight NvimTreeIndentMarker guifg=#8BD5CA ]])

        -- configure nvim-tree
        nvimtree.setup({
            view = {
                width = 40,
                relativenumber = true,
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
                            arrow_closed = "", -- arrow when folder is closed
                            arrow_open = "", -- arrow when folder is open
                        },
                        git = {
                            unstaged = "✗",
                            staged = "✓",
                            unmerged = "",
                            renamed = "➜",
                            untracked = "★",
                            deleted = "",
                            ignored = "◌",
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
                },
            },
            filters = {
                exclude = { ".DS_Store", "node_modules" },
                dotfiles = false,
            },
            git = {
                ignore = false,
            },
        })

        -- set keymaps
        local mappings = {
            n = {
                ["<leader>ee"] = { vim.cmd.NvimTreeToggle, "NvimTree toggle" },
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
