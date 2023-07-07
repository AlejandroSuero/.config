local ok, telescope = pcall(require, "telescope")
if not ok then
	vim.notify("Telescope is not installed", 3)
	return
end

local builtin = require("telescope.builtin")

local keymap = vim.keymap.set
-- local opts = { noremap = true, silent = true }
local mappings = {
	n = {
		["<leader>pf"] = builtin.find_files,
		["<C-p>"] = builtin.git_files,
		["<leader>th"] = builtin.colorscheme,
		["<leader>ps"] = function()
			builtin.grep_string({ search = vim.fn.input("Grep -> ") })
		end
	}
}

require("aome.core.keymaps").map_keys(mappings)

