---@param show_numbers boolean
local enter_zen_mode = function(show_numbers)
    local ok, zen_mode = pcall(require, "zen-mode")
    if not ok then
        vim.notify("Zen mode not loaded", 3)
        return
    end

    zen_mode.setup({
        window = {
            width = 120,
            options = {},
        },
    })
    zen_mode.toggle()
    vim.wo.wrap = false
    vim.wo.number = show_numbers
    vim.wo.rnu = show_numbers
    vim.cmd.colorscheme(vim.g.colorscheme)
end
return {
    "folke/zen-mode.nvim",
    event = "VeryLazy",
    config = function()
        local mappings = {
            n = {
                ["<leader>zz"] = {
                    function()
                        enter_zen_mode(true)
                    end,
                    "Enter zen mode with numbers",
                },
                ["<leader>zZ"] = {
                    function()
                        enter_zen_mode(false)
                    end,
                    "Enter zen mode witout numbers",
                },
            },
        }
        require("aome.core.utils").map_keys(mappings)
    end,
}
