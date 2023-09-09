return {
    "theprimeagen/harpoon",
    event = "VeryLazy",
    config = function()
        local ok, harpoon = pcall(require, "harpoon")
        if not ok then
            vim.notify("Harpoon not loaded", 3)
            return
        end
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")
        local mappings = {
            n = {
                ["<leader>a"] = {
                    mark.add_file,
                    "Harpoon adds file",
                },
                ["<C-e>"] = {
                    ui.toggle_quick_menu,
                    "Harpoon opens quick menu",
                },
                -- Mark navigation
                ["<leader>1"] = {
                    function()
                        ui.nav_file(1)
                    end,
                    "Harpoon navigates to file 1",
                },
                ["<leader>2"] = {
                    function()
                        ui.nav_file(2)
                    end,
                    "Harpoon navigates to file 2",
                },
                ["<leader>3"] = {
                    function()
                        ui.nav_file(3)
                    end,
                    "Harpoon navigates to file 3",
                },
                ["<leader>4"] = {
                    function()
                        ui.nav_file(4)
                    end,
                    "Harpoon navigates to file 4",
                },
                ["<leader>5"] = {
                    function()
                        ui.nav_file(5)
                    end,
                    "Harpoon navigates to file 5",
                },
                ["<leader>6"] = {
                    function()
                        ui.nav_file(6)
                    end,
                    "Harpoon navigates to file 6",
                },
                ["<leader>7"] = {
                    function()
                        ui.nav_file(7)
                    end,
                    "Harpoon navigates to file 7",
                },
                ["<leader>8"] = {
                    function()
                        ui.nav_file(8)
                    end,
                    "Harpoon navigates to file 8",
                },
                ["<leader>9"] = {
                    function()
                        ui.nav_file(9)
                    end,
                    "Harpoon navigates to file 9",
                },
            },
        }

        require("aome.core.utils").map_keys(mappings)

        harpoon.setup({
            menu = {
                width = (vim.api.nvim_win_get_width(0) / 2) + 10,
                height = 10,
            },
        })
    end,
}
