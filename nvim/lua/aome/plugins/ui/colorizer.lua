return {
    "NvChad/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
    config = function()
        local ok, colorizer = pcall(require, "colorizer")
        if not ok then
            vim.notify("Colorizer not installed", 3)
            return
        end
        colorizer.setup({
            user_default_options = {
                RRGGBBAA = true,
                AARRGGBB = true,
                tailwind = true,
                rgb_fn = false,
                hsl_fn = false,
                css = false,
                css_fn = false,
                names = false,
            },
        })
    end,
}
