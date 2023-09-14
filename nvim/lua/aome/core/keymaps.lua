local plugins_path = "~/.config/nvim/lua/aome/lazy.lua"

local check_netrw = function()
    local ok, _ = pcall(vim.cmd.Ex)
    if not ok then
        vim.notify("netrw is disabled, using nvim-tree instead", 3)
        vim.cmd.NvimTreeToggle()
    else
        vim.cmd.Ex()
    end
end

local mappings = {
    i = { -- insert mode
        ["jk"] = { "<ESC>", "Leave insert mode" },
        ["<C-c>"] = { "<ESC>", "Leave insert mode" },
    },
    n = { -- normal mode
        ["<leader>pv"] = {
            check_netrw,
            "Open netrw Explorer",
        },

        ["<leader>rs"] = {
            vim.cmd.LspRestart,
            "Restart LSP",
        },

        ["Y"] = { "yg$", "Copies until <eof>" },
        ["J"] = { "mzJ`z", "Better J behaviour" },

        ["<C-d>"] = { "<C-d>zz", "Keeps cursor centered when down a page" },
        ["<C-u>"] = { "<C-u>zz", "Keeps cursor centered when up a page" },
        ["n"] = { "nzzzv", "Keeps cursor centered when next search result" },
        ["N"] = { "Nzzzv", "Keeps cursor centered when previous search result" },

        ["<leader>y"] = { '"+y', "Copies to system clipboard" },
        ["<leader>Y"] = { '"+Y', "Copies to system clipboard" },

        ["<leader>d"] = { '"_d', "Deletes into the void register" },

        ["Q"] = { "<nop>", "You won't wanna go there buddy" },

        ["<leader>fm"] = {
            vim.lsp.buf.format,
            "Formats current buffer if lsp available",
        },

        -- quickfix navigation
        ["<C-k>"] = { "<cmd>cnext<CR>zz", "Next quickfix item" },
        ["<C-j>"] = { "<cmd>cprev<CR>zz", "Previous quickfix item" },

        ["<leader>x"] = {
            "<cmd>!chmod +x %<CR>",
            "Make current file executable",
        },

        ["<leader>so"] = {
            function()
                vim.cmd("so")
            end,
            "Sources current file",
        },

        ["<leader>epp"] = {
            function()
                vim.cmd.edit(plugins_path)
            end,
            "Go edit " .. plugins_path,
        },

        ["<leader>tx"] = { vim.cmd.tabclose, "Closes current tab" },
<<<<<<< HEAD
        ["<leader>bx"] = {
            function()
                if not vim.bo.modified then
                    vim.cmd("bdelete")
                    return
                end
                local filename =
                    vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
                vim.ui.select({ "Yes", "No", "Cancel" }, {
                    prompt = string.format("Save changes on %s", filename),
                }, function(choice)
                    if choice == "Yes" then
                        vim.cmd("w")
                        vim.cmd("bdelete")
                    elseif choice == "No" then
                        vim.cmd("q!")
                        vim.notify(
                            string.format(
                                "Changes in file %s not saved",
                                filename
                            ),
                            3
                        )
                    else
                        vim.notify("Action cancelled", 2)
                    end
                end)
            end,
            "Closes current buffer",
        },
        ["<C-f>"] = {
            "<cmd>silent !tmux neww tmux-sessionizer<cr>",
            "Opens a new tmux-sessionizer",
        },
=======
>>>>>>> origin/main

        ["<C-s>"] = { "<cmd>w<cr>", "Saves current file" },
        ["<C-S>"] = { "<cmd>wa<cr>", "Saves all files" },
    },
    v = { -- visual mode
        ["<leader>s"] = {
<<<<<<< HEAD
            ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
=======
            function()
                vim.cmd([[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
            end,
>>>>>>> origin/main
            "Replace selected",
        },
        ["J"] = { ":m '>+1<CR>gv=gv", "Moves code block up" },
        ["K"] = { ":m '<-2<CR>gv=gv", "Moves code block down" },

        ["<leader>y"] = { '"+y', "Copies to system clipboard" },

        ["<leader>d"] = { '"_d', "Deletes into void register" },
    },
    x = { -- x mode
        -- paste over and not delete and paste
        ["<leader>p"] = { '"_dP', "Paste over without copying into register" },
    },
}

require("aome.core.utils").map_keys(mappings)
