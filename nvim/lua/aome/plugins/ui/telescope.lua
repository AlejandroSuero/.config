return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "AlejandroSuero/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    lazy = true,
    cmd = {
        "Telescope",
    },
    config = function()
        local ok, telescope = pcall(require, "telescope")
        if not ok then
            vim.notify("Telescope not loaded", 3)
        end

        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-t>"] = actions.select_tab,
                        ["<C-q>"] = actions.send_selected_to_qflist
                            + actions.open_qflist,
                    },
                    n = {
                        ["q"] = actions.close,
                    },
                },
                file_ignore_patterns = {
                    "node_modules/",
                    "%.git/",
                    "%.DS_Store$",
                    "target/",
                    "build/",
                    "%.o$",
                },
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--hidden",
                },
                layout_config = {
                    prompt_position = "top",
                    horizontal = {
                        width_padding = 0.1,
                        height_padding = 0.1,
                        preview_width = 0.6,
                    },
                    vertical = {
                        width_padding = 0.1,
                        height_padding = 0.1,
                        preview_height = 0.5,
                    },
                },
                path_display = { "smart" },
                prompt_position = "top",
                prompt_prefix = " 󰍉 ",
                selection_caret = "  ",
                sorting_strategy = "ascending",
                winblend = 0,
                set_env = { ["COLORTERM"] = "truecolor" },
                border = {},
                borderchars = {
                    "─",
                    "│",
                    "─",
                    "│",
                    "╭",
                    "╮",
                    "╯",
                    "╰",
                },
                color_devicons = true,
            },
            pickers = {
                colorscheme = {
                    prompt_prefix = " 󰏘 ",
                },
                find_files = {
                    prompt_prefix = " 󰈔 ",
                    find_command = { "rg", "--files", "--hidden" },
                },
                git_files = {
                    prompt_prefix = " 󰊢 ",
                    show_untracked = true,
                },
                keymaps = {
                    prompt_prefix = " 󰌌 ",
                },
                commands = {
                    prompt_prefix = "  ",
                },
                help_tags = {
                    prompt_prefix = " 󰞋 ",
                },
                grep_string = {
                    prompt_prefix = " 󰬶 ",
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true, -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true, -- override the file sorter
                    case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                },
            },
        })

        telescope.load_extension("harpoon")
        telescope.load_extension("themes")

        local builtin = require("telescope.builtin")

        local mappings = {
            n = {
                -- project files
                ["<leader>pf"] = {
                    builtin.find_files,
                    "Telescope find files",
                },
                -- git files
                ["<C-p>"] = {
                    builtin.git_files,
                    "Telescope find git files",
                },
                -- colorschemes
                ["<leader>th"] = {
                    "<cmd>Telescope themes<cr>",
                    "Telescope show colorschemes",
                },
                -- find string
                ["<leader>ps"] = {
                    function()
                        builtin.grep_string({
                            search = vim.fn.input("Grep -> "),
                        })
                    end,
                    "Telescope grep string",
                },
                -- keymaps
                ["<leader>km"] = {
                    builtin.keymaps,
                    "Telescope show keymaps",
                },
                -- help tags
                ["<leader>ht"] = {
                    builtin.help_tags,
                    "Telescope show help tags",
                },
                -- commands
                ["<A-p>"] = {
                    builtin.commands,
                    "Telescope show commands",
                },
            },
        }

        require("aome.core.utils").map_keys(mappings)
    end,
}
