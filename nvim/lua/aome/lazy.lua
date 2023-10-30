local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local opts = {
    install = {
        colorscheme = { "catppuccin" },
    },
    checker = {
        enable = true,
        notify = false,
    },
    change_detection = {
        notify = false,
    },
    defaults = {
        lazy = true,
    },
    ui = {
        icons = {
            ft = "",
            lazy = "󰂠",
            loaded = "",
            not_loaded = "",
        },
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "netrw",
                "netrwPlugin",
                "netrwSettings",
                "netrwFileHandlers",
                "2html_plugin",
                "tohtml",
            },
        },
        notify = false,
    },
}

local ok, lazy = pcall(require, "lazy")
if not ok then
    vim.notify("Lazy not loaded", 3)
    return
end
lazy.setup({
    { import = "aome.plugins" },
    { import = "aome.plugins.lsp" },
    { import = "aome.plugins.ui" },
    { import = "aome.plugins.navigation" },
}, opts)
