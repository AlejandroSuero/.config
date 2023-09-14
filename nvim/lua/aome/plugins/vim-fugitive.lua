return {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    lazy = false,
    config = function()
        local mappings = {
            n = {
                ["<leader>gs"] = {
                    function()
                        vim.cmd("tab Git")
                    end,
                    "Fugitive open git in new tab",
                },
            },
        }

        local aome_fugitive = vim.api.nvim_create_augroup("aome_fugitive", {})

        local autocmd = vim.api.nvim_create_autocmd
        autocmd("BufWinEnter", {
            group = aome_fugitive,
            pattern = "*",
            callback = function()
                if vim.bo.ft ~= "fugitive" then
                    return
                end

                local bufnr = vim.api.nvim_get_current_buf()
                local opts = { buffer = bufnr, remap = false }

                local buffer_mappings = {
                    n = {
                        ["<leader>gcm"] = {
                            function()
                                vim.cmd.Git("commit")
                            end,
                            "Fugitve git commit",
                        },
                        ["<leader>gp"] = {
                            function()
                                vim.cmd.Git("push")
                            end,
                            "Fugitive git push",
                        },
                        ["<leader>P"] = {
                            function()
                                vim.cmd.Git({ "pull", "--rebase" })
                            end,
                            "Fugitive git pull and rebase",
                        },
                        ["<leader>t"] = {
                            ":Git push -u origin ",
                            "Fugitive git push origin <branch>",
                        },
                    },
                }
                require("aome.core.utils").map_keys(buffer_mappings, opts)
            end,
            require("aome.core.utils").map_keys(mappings),
        })
    end,
}
