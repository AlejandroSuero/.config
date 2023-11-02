return {
    "mbbill/undotree",
    lazy = true,
    config = true,
    cmd = { "UndotreeToggle" },
    keys = {
        { "<leader>u", vim.cmd.UndotreeToggle, "Undotree toggle" },
    },
}
