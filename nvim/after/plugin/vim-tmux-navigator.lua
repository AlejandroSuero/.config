local mappings = {
    n = {
        ["<C-h>"] = vim.cmd.TmuxNavigateLeft,
        ["<C-j>"] = vim.cmd.TmuxNavigateDown,
        ["<C-k>"] = vim.cmd.TmuxNavigateUp,
        ["<C-l>"] = vim.cmd.TmuxNavigateRight
    }
}

require("aome.core.utils").map_keys(mappings)
