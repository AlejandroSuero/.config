return {
    "jayden-chan/base46.nvim",
    lazy = false,
    config = function()
        require("base46").load_theme({
            theme = vim.g.colorscheme,
            transparency = vim.g.transparency,
        })
    end,
    priority = 1000,
}
