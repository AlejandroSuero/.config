local organize_imports = function()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    -- import lspconfig plugin
    local ok, lspconfig = pcall(require, "lspconfig")
    if not ok then
      vim.notify("LspConfig is not loaded", 3)
      return
    end

    -- import cmp-nvim-lsp plugin
    local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if not ok_cmp then
      vim.notify("Cmp-nvim-lsp is not loaded", 3)
      return
    end

    local ok_builtin, telescope_builtin = pcall(require, "telescope.builtin")
    if not ok_builtin then
      vim.notify("Telescope builtin is not loaded", 3)
      return
    end

    local opts = { noremap = true, silent = true }

    -- Function that runs when server is attached to buffer
    ---@param _ table Client
    ---@param bufnr integer Number of buffer
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr
      client.server_capabilities.signatureHelpProvider =
        client.server_capabilities.signatureHelpProvider

      local mappings = {
        n = {
          ["gR"] = {
            telescope_builtin.lsp_references,
            "LSP show references",
          },
          ["gD"] = {
            vim.lsp.buf.declaration,
            "LSP go to declaration",
          },
          ["gd"] = {
            telescope_builtin.lsp_definitions,
            "LSP show definitions",
          },
          ["gi"] = {
            telescope_builtin.lsp_implementations,
            "LSP show implementations",
          },
          ["gt"] = {
            telescope_builtin.lsp_type_definitions,
            "LSP show type definitions",
          },
          ["<leader>ca"] = {
            vim.lsp.buf.code_action,
            "LSP see available code actions",
          },
          ["<leader>rn"] = {
            vim.lsp.buf.rename,
            "LSP rename",
          },
          ["<leader>D"] = {
            function()
              telescope_builtin.diagnostics { bufnr = bufnr }
            end,
            "LSP show buffer diagnostics",
          },
          ["[d"] = {
            vim.diagnostic.goto_prev,
            "LSP go to previous diagnostic",
          },
          ["]d"] = {
            vim.diagnostic.goto_next,
            "LSP go to next diagnostic",
          },
          ["<leader>ld"] = {
            vim.diagnostic.open_float,
            "LSP show line diagnostic",
          },
          ["K"] = {
            vim.lsp.buf.hover,
            "LSP show documentation under cursor",
          },
        },
      }
      require("aome.core.utils").map_keys(mappings, opts)
    end

    -- used to enable autocompletion (assign to every lsp server config)
    -- local capabilities = cmp_nvim_lsp.default_capabilities()
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    capabilities.textDocument.completion.completionItem = {
      documentationFormat = { "markdown", "plaintext" },
      snippetSupport = true,
      preselectSupport = true,
      insertReplaceSupport = true,
      labelDetailsSupport = true,
      deprecatedSupport = true,
      commitCharactersSupport = true,
      tagSupport = { valueSet = { 1 } },
      resolveSupport = {
        properties = {
          "documentation",
          "detail",
          "additionalTextEdits",
        },
      },
    }

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs =
      { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    local servers = {
      html = true,
      tsserver = {
        commands = {
          OrganizeImports = {
            organize_imports,
            description = "Organize Imports",
          },
        },
        nit_options = {
          preferences = {
            disableSuggestions = true,
          },
        },
      },
      astro = true,
      rust_analyzer = true,
      svelte = true,
      tailwindcss = true,
      cssls = true,
      jsonls = true,
      prismals = true,
      graphql = true,
      emmet_ls = {
        filetypes = {
          "html",
          "typescriptreact",
          "javascriptreact",
          "css",
          "sass",
          "scss",
          "less",
          "svelte",
          "astro",
        },
      },
      pyright = true,
      lua_ls = {
        settings = { -- custom settings for lua
          Lua = {
            -- make the language server recognize "vim" global
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              -- make language server aware of runtime files
              library = {
                [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                [vim.fn.stdpath "config" .. "lua/aome"] = true,
                [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
              },
              checkThirdParty = false,
              maxPreload = 100000,
              preloadFileSize = 10000,
            },
          },
        },
      },
      gopls = {
        root_dir = function(fname)
          local Path = require "plenary.path"

          local absolute_cwd = Path:new(vim.loop.cwd()):absolute()
          local absolute_fname = Path:new(fname):absolute()

          if
            string.find(absolute_cwd, "/cmd/", 1, true)
            and string.find(absolute_fname, absolute_cwd, 1, true)
          then
            return absolute_cwd
          end

          return require("lspconfig.util").root_pattern("go.mod", ".git")(fname)
        end,

        settings = {
          gopls = {
            codelenses = { test = true },
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            } or nil,
          },
        },
      },
      clangd = {
        on_attach = function(client, bufnr)
          client.server_capabilities.signatureHelpProvider = false
          on_attach(client, bufnr)
        end,
        capabilities = capabilities,
      },
    }

    ---Setup given server with given configuration, adding on_attach and
    --capabilities to all by default
    ---@param server string
    ---@param config table|boolean|nil
    local setup_server = function(server, config)
      if not config then
        return
      end
      if type(config) ~= "table" then
        config = {}
      end
      config = vim.tbl_deep_extend("force", {
        on_attach = on_attach,
        capabilities = capabilities,
      }, config)
      lspconfig[server].setup(config)
    end

    for server, config in pairs(servers) do
      setup_server(server, config)
    end
  end,
}
