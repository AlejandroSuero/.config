return {
    "xiyaowong/transparent.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local mappings = {
            n = {
                ["<C-t>"] = {
                    "<cmd>TransparentToggle<cr>",
                    "Toggle transparency",
                },
            },
        }
        require("aome.core.utils").map_keys(mappings)
    end,
}
