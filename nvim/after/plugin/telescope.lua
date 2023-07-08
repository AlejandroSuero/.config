local ok, telescope = pcall(require, "telescope")
if not ok then
    vim.notify("Telescope is not installed", 3)
    return
end

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
        ["<leader>ht"] = builtin.help_tags
    }
}

require("aome.core.utils").map_keys(mappings)
