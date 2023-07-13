local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local mappings = {
	n = {
		["<leader>a"] = mark.add_file,
		["<C-e>"] = ui.toggle_quick_menu,
		-- navigations
		["<C-7>"] = function() ui.nav_file(1) end,
		["<C-8>"] = function() ui.nav_file(2) end,
		["<C-9>"] = function() ui.nav_file(3) end,
		["<C-0>"] = function() ui.nav_file(4) end,
	}
}

require("aome.core.utils").map_keys(mappings)
