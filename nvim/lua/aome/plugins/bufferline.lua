return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
<<<<<<< HEAD
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        options = {
            mode = "buffers",
            separator_style = "thick",
            always_show_bufferline = false,
            color_icons = true,
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "",
                    padding = 1,
                },
                {
                    filetype = "Undotree",
                    text = "",
                    padding = 1,
                },
            },
=======
    opts = {
        options = {
            mode = "tabs",
            separator_style = "thick",
            always_show_bufferline = false,
            color_icons = true,
>>>>>>> origin/main
        },
    },
    config = function(_, opts)
        local ok, bufferline = pcall(require, "bufferline")
        if not ok then
            vim.notify("Bufferline not loaded", 3)
            return
        end

        bufferline.setup(opts)

        local mappings = {
            n = {
                ["<Tab>"] = { vim.cmd.BufferLineCycleNext, "Cycle to next tab" },
                ["<S-Tab>"] = {
                    vim.cmd.BufferLineCyclePrev,
                    "Cycle to previous tab",
                },
            },
        }
        require("aome.core.utils").map_keys(mappings)
    end,
}
