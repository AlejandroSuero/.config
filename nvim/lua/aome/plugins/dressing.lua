return {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {
        input = {
            title_pos = "center",
            win_options = {
                winblend = 0
            }
        }
    },
    config = function(_, opts)
        local ok, dressing = pcall(require, "dressing")
        if not ok then
            vim.notify("Dressing is not loaded", 3)
            return
        end
        dressing.setup(opts)
    end
}
