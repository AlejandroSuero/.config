return {
    "lewis6991/gitsigns.nvim",
    opts = {
        signs = {
            add = { text = "+" },
            change = { text = "~" },
            delete = { text = "_" },
            topdelete = { text = "‾" },
            changedelete = { text = "~" },
            untracked = { text = "┆" },
        },
        numhl = true,
        max_file_length = 10000,
    },
    config = function(_, opts)
        local ok, gitsigns = pcall(require, "gitsigns")
        if not ok then
            vim.notify("GitSigns not installed", 3)
            return
        end
        gitsigns.setup(opts)
    end,
    event = { "BufReadPre", "BufNewFile" },
}
