local env = vim.env

local options = {
  opt = {   -- opt scope
    guicursor = "",
    guifont = "*",

    background = "dark",

    cmdheight = 1,

    shell = env.SHELL,

    number = true,
    relativenumber = true,

    tabstop = 2,
    softtabstop = 2,
    shiftwidth = 2,
    expandtab = true,

    smartindent = true,
    autoindent = true,

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
    showmode = false,
    cursorline = true,
  },
  g = {   -- global scope
    netrw_banner = false,
    netrw_browse_split = 0,
    netrw_winsize = 25,
    netrw_list_hide = "node_modules",

    mapleader = " ",
  },
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

-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.env.PATH
    .. (is_windows and ";" or ":")
    .. vim.fn.stdpath("data")
    .. "/mason/bin"
