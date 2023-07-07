local mappings = {
	n = {
		["<leader>u"] = vim.cmd.UndotreeToggle
	}
}

require("aome.core.keymaps").map_keys(mappings)
