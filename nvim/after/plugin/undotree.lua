local mappings = {
	n = {
		["<leader>u"] = vim.cmd.UndotreeToggle
	}
}

require("aome.core.utils").map_keys(mappings)
