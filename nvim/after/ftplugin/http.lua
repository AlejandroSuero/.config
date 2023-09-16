local ok, rest = pcall(require, "rest-nvim")
if not ok then
    vim.notify("RestNvim not loaded", 3)
    return
end

local mappings = {
    n = {
        ["<leader>hx"] = {
            rest.run,
            "Execute request",
        },
        ["<leader>hp"] = {
            function()
                rest.run(true)
            end,
            "Preview curl request",
        },
        ["<leader>hl"] = {
            rest.last,
            "Repeat last request",
        },
    },
}

require("aome.core.utils").map_keys(mappings)
