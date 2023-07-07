local ok, zenmode = pcall(require, "zen-mode")
if not ok then
    vim.notify("Zen-mode is not installed", 3)
    return
end

local mappings = {
    n = {
        ["<leader>zz"] = function()
            zenmode.setup {
                window = {
                    width = 100,
                    options = {}
                },
            }
            zenmode.toggle()
            vim.wo.wrap = false
            vim.wo.number = true
            vim.wo.rnu = true
            vim.cmd.colorscheme(vim.g.colorscheme)
        end,
        ["<leader>zZ"] = function()
            zenmode.setup {
                window = {
                    width = 100,
                    options = {}
                },
            }
            zenmode.toggle()
            vim.wo.wrap = false
            vim.wo.number = false
            vim.wo.rnu = false
            vim.opt.colorcolumn = "0"
            vim.cmd.colorscheme(vim.g.colorscheme)
        end
    }
}

require("aome.core.keymaps").map_keys(mappings)
