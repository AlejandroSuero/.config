return {
    "xiyaowong/transparent.nvim",
    lazy = true,
    cmd = "TransparentToggle",
    config = true,
    keys = {
        { "<C-t>", vim.cmd.TransparentToggle, desc = "Toggle transparency" },
    },
}
