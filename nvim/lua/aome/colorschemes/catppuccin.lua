local ok, catppuccin = pcall(require, "catppuccin")
if not ok then
	vim.notify("COLORSCHEME: catppuccin is not installed", 3)
	return
end

catppuccin.setup {
	transparent_background = true,
	term_colors = true,
	dim_inactive = {
		enabled = true,
		percentage = 0.5
	},
	styles = {
		conditionals = {}
	}
}

