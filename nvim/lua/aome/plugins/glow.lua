return {
    "ellisonleao/glow.nvim",
    lazy = true,
    config = function()
        local ok, glow = pcall(require, "glow")
        if not ok then
            vim.notify("Glow is not installed", vim.log.levels.ERROR)
        end
        glow.setup({
            install_path = "~/.local/bin",
            style = "dark",
            width = vim.o.columns,
            height = vim.o.lines,
        })
    end,
    cmd = "Glow",
    keys = {
        { "<leader>md", "<cmd>Glow<cr>", desc = "Markdown Preview" },
    },
    ft = "markdown",
}
