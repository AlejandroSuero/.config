return {
    "windwp/nvim-autopairs",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local ok, autopairs = pcall(require, "nvim-autopairs")
        if not ok then
            vim.notify("Autopairs not loaded", 3)
            return
        end
        autopairs.setup({
            disable_filetype = { "TelescopePrompt", "spectre_panel",  "vim" },
            check_ts = true,
            ts_config = {
                lua = { "string" },
                javascript = { "template_string" }
            }
        })
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        local ok_cmp, cmp = pcall(require, "cmp")
        if not ok_cmp then
            vim.notify("Cmp not loaded", 3)
            return
        end
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end
}
