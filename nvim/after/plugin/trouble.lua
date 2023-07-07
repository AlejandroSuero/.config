local mappings = {
    n = {
        ["<leader>xq"] = "<cmd>TroubleToggle quickfix<CR>"
    }
}

require("aome.core.keymaps").map_keys(mappings)

