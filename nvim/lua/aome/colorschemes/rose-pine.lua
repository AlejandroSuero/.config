local ok, rosepine = pcall(require, "rose-pine")
if not ok then
	vim.notify("COLORSCHEME: rose-pine not installed", 3)
	return
end

rosepine.setup {
	disable_background = true
}

