return {
    "mbbill/undotree",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local mappings = {
            n = {
                ["<leader>u"] = { vim.cmd.UndotreeToggle, "Undotree toggle" },
            },
        }
        require("aome.core.utils").map_keys(mappings)
    end,
}
