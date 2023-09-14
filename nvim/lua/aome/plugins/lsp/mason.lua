return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "jayp0521/mason-null-ls.nvim",
    },
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
        local ok, mason = pcall(require, "mason")
        if not ok then
            vim.notify("Mason is not loaded", 3)
            return
        end

        mason.setup(opts)

        vim.api.nvim_create_user_command("MasonInstallAll", function()
            vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
        end, {})

        vim.g.mason_binaries_list = opts.ensure_installed
    end,
}