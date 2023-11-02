return {
    "jayden-chan/base46.nvim",
    lazy = false,
    config = function()
        require("base46").load_theme(
            require("aome.core.utils").default_coloscheme_opts
        )
    end,
    priority = 1000,
}
