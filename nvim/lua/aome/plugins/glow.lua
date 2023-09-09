return {
    "ellisonleao/glow.nvim",
    ft = "markdown",
    config = function()
        local ok, glow = pcall(require, "glow")
        if not ok then
            return
        end

        glow.setup({
            style = "dark",
            -- fullscreen
            width_ratio = 1,
            height_ratio = 1,
        })

        local mappings = {
            n = {
                ["<leader>md"] = {
                    function()
                        vim.cmd("tab Glow")
                    end,
                    "Opens markdown preview",
                },
            },
        }

        require("aome.core.utils").map_keys(mappings)
    end,
}
