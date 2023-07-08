local mappings = {
    n = {
        ["<leader>xq"] = "<cmd>TroubleToggle quickfix<CR>"
    }
}

require("aome.core.utils").map_keys(mappings)

