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
      icons = {
        File = " ",
        Module = " ",
        Namespace = " ",
        Package = " ",
        Class = " ",
        Method = " ",
        Property = " ",
        Field = " ",
        Constructor = " ",
        Enum = " ",
        Interface = " ",
        Function = " ",
        Variable = " ",
        Constant = " ",
        String = " ",
        Number = " ",
        Boolean = " ",
        Array = " ",
        Object = " ",
        Key = " ",
        Null = " ",
        EnumMember = " ",
        Struct = " ",
        Event = " ",
        Operator = " ",
        TypeParameter = " ",
      },
      active = true,
      click = true,
      highlight = true,
    }
  end,
}
