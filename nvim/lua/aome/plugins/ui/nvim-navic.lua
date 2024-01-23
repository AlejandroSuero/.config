return {
  "SmiteshP/nvim-navic",
  dependencies = "neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    local ok, navic = pcall(require, "nvim-navic")
    if not ok then
      vim.notify("Breadcrums are not loaded", vim.log.levels.WARN)
      return
    end
    navic.setup {
      active = true,
      click = true,
      highlight = true,
    }
  end,
}
