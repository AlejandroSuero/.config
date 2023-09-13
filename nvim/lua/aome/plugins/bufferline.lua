return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        options = {
            mode = "buffers",
            separator_style = "thick",
            always_show_bufferline = true,
            color_icons = true,
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "",
                    padding = 1,
                },
            },
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
