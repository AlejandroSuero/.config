return {
    "lukas-reineke/indent-blankline.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    opts = {
        exclude = {
            filetypes = {
                "help",
                "terminal",
                "lazy",
                "lspinfo",
                "TelescopePrompt",
                "TelescopeResults",
                "mason",
                "",
            },
            buftypes = { "terminal" },
        },
        scope = {
            enabled = true,
        },
    },
    config = function(_, opts)
        local ok_blankline, blankline = pcall(require, "ibl")
        if not ok_blankline then
            vim.notify("Indent blankline not installed", 3)
            return
        end
        blankline.setup(opts)
    end,
}
