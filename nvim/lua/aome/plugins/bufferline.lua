return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    opts = {
        options = {
            mode = "tabs",
            separator_style = "thick",
            always_show_bufferline = false,
            color_icons = true,
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
