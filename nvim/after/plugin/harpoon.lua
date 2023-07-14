local ok, harpoon = pcall(require, "harpoon")
if not ok then
    vim.notify("Harpoon is not insalled")
    return
end

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local mappings = {
	n = {
		["<leader>a"] = mark.add_file,
		["<C-e>"] = ui.toggle_quick_menu,
		-- navigations
		["<leader-1>"] = function() ui.nav_file(1) end,
		["<leader-2>"] = function() ui.nav_file(2) end,
		["<leader-3>"] = function() ui.nav_file(3) end,
		["<leader-4>"] = function() ui.nav_file(4) end,
	}
}

require("aome.core.utils").map_keys(mappings)

harpoon.setup {
    menu = {
        width = (vim.api.nvim_win_get_width(0) / 2) + 10,
        height = 10
    }
}
