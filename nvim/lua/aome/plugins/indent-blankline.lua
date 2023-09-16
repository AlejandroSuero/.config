local hl_groups = nil
local ok, colors = pcall(require, "aome.colorschemes.catppuccin")
if not ok then
    vim.notify("Catppuccin colors not loaded", 3)
else
    hl_groups = {
        IndentBlanklineChar = { fg = colors.blue },
        IndentBlankLineContextChar = { fg = colors.blue },
        IndentBlanklineIndent1 = { fg = colors.blue },
        IndentBlanklineIndent2 = { fg = colors.blue },
        IndentBlanklineIndent3 = { fg = colors.blue },
        IndentBlanklineIndent4 = { fg = colors.blue },
        IndentBlanklineIndent5 = { fg = colors.blue },
        IndentBlanklineIndent6 = { fg = colors.blue },
    }
end
return {
    "lukas-reineke/indent-blankline.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        indentLine_enabled = 1,
        filetype_exclude = {
            "help",
            "terminal",
            "lazy",
            "lspinfo",
            "TelescopePrompt",
            "TelescopeResults",
            "mason",
            "",
        },
        buftype_exclude = { "terminal" },
        show_trailing_blankline_indent = false,
        show_first_indent_level = true,
        show_current_context = true,
        show_current_context_start = true,
    },
    config = function(_, opts)
        local ok_blankline, blankline = pcall(require, "indent_blankline")
        if not ok_blankline then
            vim.notify("Indent blankline not installed", 3)
            return
        end
        blankline.setup(opts)

        if hl_groups ~= nil then
            for group, color in pairs(hl_groups) do
                vim.api.nvim_set_hl(0, group, color)
            end
        end
    end,
}
