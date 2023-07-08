local M = {}

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

M.map_keys = function(mappings_table)
    local options = opts
    for mode, mappings in pairs(mappings_table) do
        if mode == 't' then
            options = term_opts
        else
            options = opts
        end
        for lhs, rhs in pairs(mappings) do
            vim.keymap.set(mode, lhs, rhs, options)
        end
    end
end

return M
