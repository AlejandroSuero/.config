local ok, telescope = pcall(require, "telescope")
if not ok then
    vim.notify("Telescope is not installed", 3)
    return
end

local actions = require "telescope.actions"

telescope.setup {
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-t>"] = actions.select_tab,
            },
            n = {
                ["q"] = actions.close
            }
        },
        file_ignore_patterns = { ".git/", "node_modules" },
        layout_config = {
            prompt_position = "top"
        },
        path_display = { "smart" },
        prompt_position = "top",
        prompt_prefix = " 󰍉 ",
        selection_caret = "  ",
        sorting_strategy = "ascending",
        winblend = 0,
        set_env = { ["COLORTERM"] = "truecolor" }
    },
    pickers = {
        colorscheme = {
            prompt_prefix = " 󰏘 "
        },
        find_files = {
            prompt_prefix = " 󰈔 ",
            find_command = { "rg", "--files", "--hidden" }
        },
        git_files = {
            prompt_prefix = " 󰊢 ",
            show_untracked = true
        },
        keymaps = {
            prompt_prefix = " 󰌌 "
        },
        commands = {
            prompt_prefix = "  "
        },
        help_tags = {
            prompt_prefix = " 󰞋 "
        },
        grep_string = {
            prompt_prefix = " 󰬶 "
        }
    }
}

telescope.load_extension("harpoon")

local builtin = require("telescope.builtin")

-- local opts = { noremap = true, silent = true }
local mappings = {
    n = {
        -- project files
        ["<leader>pf"] = builtin.find_files,
        -- git files
        ["<C-p>"] = builtin.git_files,
        -- colorschemes
        ["<leader>th"] = builtin.colorscheme,
        -- find string
        ["<leader>ps"] = function()
            builtin.grep_string({ search = vim.fn.input("Grep -> ") })
        end,
        -- keymaps
        ["<leader>km"] = builtin.keymaps,
        -- help tags
        ["<leader>ht"] = builtin.help_tags,
        -- commands
        ["<A-p>"] = builtin.commands
    }
}

require("aome.core.utils").map_keys(mappings)
