local ok, colorizer = pcall(require, "colorizer")
if not ok then
    vim.notify("Colorizer not installed", 3)
    return
end

colorizer.setup {
    user_default_options = {
        RRGGBBAA = true,
        AARRGGBB = true,
        tailwind = true
    }
}

