return {
  "nvimtools/none-ls.nvim", -- configure formatters & linters
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- import null-ls plugin
    local ok, null_ls = pcall(require, "null-ls")
    if not ok then
      vim.notify("Null-ls is not loaded", 3)
      return
    end

    local null_ls_utils = require "null-ls.utils"

    -- for conciseness
    local formatting = null_ls.builtins.formatting -- to setup formatters
    local diagnostics = null_ls.builtins.diagnostics -- to setup linters

    -- to setup format on save
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    -- configure null_ls
    null_ls.setup {
      -- add package.json as identifier for root (for typescript monorepos)
      root_dir = null_ls_utils.root_pattern(
        ".null-ls-root",
        "Makefile",
        ".git",
        "package.json"
      ),
      -- setup formatters & linters
      sources = {
        formatting.stylua,
        diagnostics.eslint,
        formatting.eslint_d,
        formatting.gofumpt,
        formatting.goimports_reviser,
        formatting.golines,
        formatting.clang_format,
      },
      -- configure format on save
      on_attach = function(current_client, bufnr)
        if current_client.supports_method "textDocument/formatting" then
          vim.api.nvim_clear_autocmds {
            group = augroup,
            buffer = bufnr,
          }
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format {
                filter = function(client)
                  --  only use null-ls for formatting instead of lsp server
                  return client.name == "null-ls"
                end,
                bufnr = bufnr,
              }
            end,
          })
        end
      end,
    }
  end,
}
