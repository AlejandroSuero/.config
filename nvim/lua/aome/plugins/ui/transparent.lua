return {
    "xiyaowong/transparent.nvim",
    lazy = false,
    cmd = "TransparentToggle",
    config = true,
    keys = {
        { "<C-t>", vim.cmd.TransparentToggle, desc = "Toggle transparency" },
    },
}
