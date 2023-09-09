---@meta

local M = {}

-- Maps keys with options
---@param mappings_table table Table that contains the mappings
---@param mapping_opt table|nil that contains the mapping options
M.map_keys = function(mappings_table, mapping_opt)
    for mode, mappings in pairs(mappings_table) do
        local default_opts =
            vim.tbl_deep_extend("force", { mode = mode }, mapping_opt or {})

        for keybind, mapping_info in pairs(mappings) do
            if type(mapping_info) ~= "table" then
                mapping_info = { mapping_info }
            end
            local opts = vim.tbl_deep_extend(
                "force",
                default_opts,
                mapping_info.opts or {}
            )

            mapping_info.opts, opts.mode = nil, nil
            opts.desc = mapping_info[2] or "No description added"

            vim.keymap.set(mode, keybind, mapping_info[1], opts)
        end
    end
end

return M
