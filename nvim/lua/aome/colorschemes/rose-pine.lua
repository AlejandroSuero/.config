local ok, rosepine = pcall(require, "rose-pine")
if not ok then
    vim.notify("COLORSCHEME: rose-pine not installed", 3)
    return
end

rosepine.setup({
    variant = "moon",
    dark_variant = "moon",
    dim_nc_background = true,
    disable_background = vim.g.transparency,
    disable_italics = true,
})
