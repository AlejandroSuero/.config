<<<<<<< HEAD
return {
    white = "#D9E0EE",
    darker_black = "#191828",
    black = "#1E1D2D", --  nvim bg
    black2 = "#252434",
    one_bg = "#2d2c3c", -- real bg of onedark
    one_bg2 = "#363545",
    one_bg3 = "#3e3d4d",
    grey = "#474656",
    grey_fg = "#4e4d5d",
    grey_fg2 = "#555464",
    light_grey = "#605f6f",
    red = "#F38BA8",
    baby_pink = "#ffa5c3",
    pink = "#F5C2E7",
    line = "#383747", -- for lines like vertsplit
    green = "#ABE9B3",
    vibrant_green = "#b6f4be",
    nord_blue = "#8bc2f0",
    blue = "#89B4FA",
    yellow = "#FAE3B0",
    sun = "#ffe9b6",
    purple = "#d0a9e5",
    dark_purple = "#c7a0dc",
    teal = "#B5E8E0",
    orange = "#F8BD96",
    cyan = "#89DCEB",
    statusline_bg = "#232232",
    lightbg = "#2f2e3e",
    pmenu_bg = "#ABE9B3",
    folder_bg = "#89B4FA",
    lavender = "#c7d1ff",
=======
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
    },
    integrations = {
        treesitter = true,
        native_lsp = {
            enable = false,
            virtual_text = {
                errors      = { "italic" },
                information = { "italic" },
                hints       = { "italic" },
                warnings    = { "italic" }
            },
            underlines = {
                errors      = { "underline" },
                information = { "underline" },
                hints       = { "underline" },
                warnings    = { "underline" }
            }
        },
        noice = true,
        notify = true,
        lsp_trouble = false,
        cmp = true,
        gitsigns = true,
        telescope = true,
        markdown = true,
        mason = true,
        harpoon = true
    }
>>>>>>> origin/main
}
