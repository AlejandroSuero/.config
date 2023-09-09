return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local ok, trouble = pcall(require, "trouble")
        if not ok then
            vim.notify("Trouble is not loaded", 3)
            return
        end
        trouble.setup({
            icons = false,
        })
        local mappings = {
            n = {
                ["<leader>qF"] = {
                    "<cmd>TroubleToggle quickfix<cr>",
                    "Trouble toggle quickfix list",
                },
            },
        }
        require("aome.core.utils").map_keys(mappings)
    end,
}
