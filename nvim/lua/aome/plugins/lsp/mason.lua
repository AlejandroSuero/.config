return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "jayp0521/mason-null-ls.nvim",
    },
<<<<<<< HEAD
    cmd = {
        "Mason",
        "MasonInstall",
        "MasonInstallAll",
        "MasonUpdate",
        "MasonUninstall",
    },
    opts = {
        ui = {
            icons = {
                package_pending = " ",
                package_installed = "󰄳 ",
                package_uninstalled = " 󰚌",
            },
        },
        keymaps = {
            toggle_server_expand = "<CR>",
            install_server = "i",
            update_server = "u",
            check_server_version = "c",
            update_all_servers = "U",
            check_outdated_servers = "C",
            uninstall_server = "X",
            cancel_installation = "<C-c>",
        },
        ensure_installed = {
            "typescript-language-server",
            "lua-language-server",
            "html-lsp",
            "css-lsp",
            "tailwindcss-language-server",
            "svelte-language-server",
            "graphql-language-service-cli",
            "emmet-ls",
            "prisma-language-server",
            "pyright",
            "gopls",
            "rust-analyzer",
            "intelephense",
            "astro-language-server",
            "json-lsp",
            "eslint-lsp",
            "marksman",
            "prettier", -- ts/js formatter
            "stylua", -- lua formatter
            "eslint_d", -- ts/js linter
        },
        automatic_installation = true,
        max_concurrent_installers = 10,
    },
    config = function(_, opts)
=======
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    opts = {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
            },
        },
        lsp = {
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
                "intelephense",
                "astro",
                "jsonls",
            },
            automatic_installation = true,
        },
        null_ls = {
            ensure_installed = {
                "prettier", -- ts/js formatter
                "stylua", -- lua formatter
                "eslint_d", -- ts/js linter
            },
            automatic_installation = true,
        },
    },
    config = function(_, opts)
        -- import mason
>>>>>>> origin/main
        local ok, mason = pcall(require, "mason")
        if not ok then
            vim.notify("Mason is not loaded", 3)
            return
        end

<<<<<<< HEAD
        mason.setup(opts)

        vim.api.nvim_create_user_command("MasonInstallAll", function()
            vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
        end, {})

        vim.g.mason_binaries_list = opts.ensure_installed
=======
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

        mason.setup({ ui = opts.ui })
        mason_lspconfig.setup(opts.lsp)
        mason_null_ls.setup(opts.null_ls)

        local mason_servers =
            vim.tbl_deep_extend("force", opts.null_ls, opts.lsp)
        vim.api.nvim_create_user_command("MasonInstallAll", function()
            vim.cmd(
                "MasonInstall "
                    .. table.concat(mason_servers.ensure_installed, " ")
            )
        end, {})

        vim.g.mason_binaries_list = mason_servers
>>>>>>> origin/main
    end,
}
