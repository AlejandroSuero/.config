local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local mappings = {
	n = {
		["<leader>a"] = mark.add_file,
		["<C-e>"] = ui.toggle_quick_menu,
		-- navigations
		["<C-y>"] = function() ui.nav_file(1) end,
		["<C-u>"] = function() ui.nav_file(2) end,
		["<C-i>"] = function() ui.nav_file(3) end,
		["<C-o>"] = function() ui.nav_file(4) end,
	}
}

require("aome.core.utils").map_keys(mappings)
