local ok, autopairs = pcall(require, "nvim-autopairs")
if (not ok) then
    vim.notify("Autopairs is not installed", 3)
    return
end

autopairs.setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})
