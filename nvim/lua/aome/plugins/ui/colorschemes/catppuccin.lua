local M = {}

M.options = {
  transparent_background = vim.g.transparency,
  term_colors = vim.opt.termguicolors,
  dim_inactive = {
    enabled = true,
    percentage = 0.30
  },
  styles = {
    conditionals = {}
  },
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    treesitter = true,
    mini = {
      enabled = true,
      indentscope_color = "",
    },
    alpha = true,
    harpoon = true,
    indent_blankline = {
      enabled = true,
      scope_color = "lavender"
    },
    native_lsp = {
      enabled = vim.g.lsp_semantic_tokens,
    },
    semantic_tokens = vim.g.lsp_semantic_tokens,
    leap = true,
    telescope = {
      enabled = true,
      style = "nvchad"
    },
    which_key = true
  }
}

M.colors = {
  bg = "#1E1D2D"
}

return M
