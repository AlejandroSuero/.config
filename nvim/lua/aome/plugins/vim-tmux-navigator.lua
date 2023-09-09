return {
    "christoomey/vim-tmux-navigator",
    config = function()
        local mappings = {
            n = {
                ["<C-h>"] = { vim.cmd.TmuxNavigateLeft, "Tmux navigate left" },
                ["<C-j>"] = { vim.cmd.TmuxNavigateDown, "Tmux navigate down" },
                ["<C-k>"] = { vim.cmd.TmuxNavigateUp, "Tmux navigate up" },
                ["<C-l>"] = { vim.cmd.TmuxNavigateRight, "Tmux navigate Right" },
            },
        }
        require("aome.core.utils").map_keys(mappings)
    end,
}
