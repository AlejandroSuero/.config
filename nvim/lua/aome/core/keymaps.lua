local mappings = {
    i = { -- insert mode
        ["jk"] = "<ESC>",
        ["<C-c>"] = "<ESC>"
    },
    n = { -- normal mode
        -- explorer
        ["<leader>pv"] = "<cmd>Ex<CR>",

        -- navigation
        ["Y"] = "yg$",
        ["J"] = "mzJ`z",
        ["<C-d>"] = "<C-d>zz",
        ["<C-u>"] = "<C-u>zz",
        ["n"] = "nzzzv",
        ["N"] = "Nzzzv",

        -- system clipboard
        ["<leader>y"] = "\"+y",
        ["<leader>Y"] = "\"+Y",

        -- delete into the void
        ["<leader>d"] = "\"_d",

        -- never again
        ["Q"] = "<nop>",

        -- formatting
        ["<leader>fm"] = function() vim.lsp.buf.format() end,

        -- quickfix navigation
        ["<C-k>"] = "<cmd>cnext<CR>zz",
        ["<C-j>"] = "<cmd>cprev<CR>zz",

        -- replace highlighted
        ["<leader>s"] = [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],

        -- make executable
        ["<leader>x"] =  "<cmd>!chmod +x %<CR>",

        -- source file
        ["<leader>so"] = function() vim.cmd("so") end,

        -- edit plugins
        ["<leader>epp"] = "<cmd>e ~/.config/nvim/lua/aome/packer.lua<CR>",

        -- tabclose
        ["<leader>tc"] = "<cmd>tabclose<CR>"
    },
    v = { -- visual mode
        -- move block of code
        ["J"] = ":m '>+1<CR>gv=gv",
        ["K"] = ":m '<-2<CR>gv=gv",

        -- system clipboard
        ["<leader>y"] = "\"+y",

        -- delete into de void
        ["<leader>d"] = "\"_d",
    },
    x = { -- x mode
        -- paste over and not delete and paste
        ["<leader>p"] = "\"_dP",
    },
}

require("aome.core.utils").map_keys(mappings)

