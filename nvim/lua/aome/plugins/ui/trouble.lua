return {
    "folke/trouble.nvim",
    enabled = true,
    dependencies = "kyazdani42/nvim-web-devicons",
    cmd = "TroubleToggle",
    keys = {
        {
            "<leader><leader>t",
            "<cmd>TroubleToggle<cr>",
            desc = "Trouble toggle",
        },
    },
    config = true,
}
