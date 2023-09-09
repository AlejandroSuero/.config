return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "jayp0521/mason-null-ls.nvim",
  },
  config = function()
    -- import mason
    local ok, mason = pcall(require, "mason")
    if not ok then
        vim.notify("Mason is not loaded", 3)
        return
    end

    -- import mason-lspconfig
    local ok_lsp, mason_lspconfig = pcall(require, "mason-lspconfig")
    if not ok_lsp then
        vim.notify("Mason-lspconfig is not loaded", 3)
        return
    end

    -- import mason-null-ls
    local ok_null_ls, mason_null_ls = pcall(require, "mason-null-ls")
    if not ok_null_ls then
        vim.notify("Mason-null-ls is not loaded", 3)
        return
    end

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
      }
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "tsserver",
        "eslint",
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "graphql",
        "emmet_ls",
        "prismals",
        "pyright",
        "gopls",
        "rust_analyzer",
        "intelephense"
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })

    mason_null_ls.setup({
      -- list of formatters & linters for mason to install
      ensure_installed = {
        "prettier", -- ts/js formatter
        "stylua", -- lua formatter
        "eslint_d", -- ts/js linter
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true,
    })
  end,
}
