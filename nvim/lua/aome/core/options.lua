local env = vim.env

local options = {
    opt = { -- opt scope
        guicursor = "",
        guifont = "*",

        cmdheight = 0,

        shell = env.SHELL,

        number = true,
        relativenumber = true,

        tabstop = 4,
        softtabstop = 4,
        shiftwidth = 4,
        expandtab = true,

        smartindent = true,

        wrap = false,

        swapfile = false,
        backup = false,
        undodir = os.getenv("HOME") .. "/.vim/undodir",
        undofile = true,

        hlsearch = false,
        incsearch = true,

        termguicolors = true,

        scrolloff = 13,
        signcolumn = "yes",

        winblend = 0,

        updatetime = 50,

        colorcolumn = "80",
        showmode = false
    },
    g = { -- global scope
        netrw_banner = false,
        netrw_browse_split = 0,
        netrw_winsize = 25,
        mapleader = " ",
        colorscheme = "catppuccin"
    }
}

local set_options = function(options_table)
    for scope, opts in pairs(options_table) do
        for opt, value in pairs(opts) do
            vim[scope][opt] = value
        end
    end
end

set_options(options)

vim.opt.isfname:append("@-@")
