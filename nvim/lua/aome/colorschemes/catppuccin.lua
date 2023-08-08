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
        lsp_trouble = false,
        cmp = true,
        gitsigns = true,
        telescope = true,
        markdown = true,
        mason = true,
        harpoon = true
    }
}
