local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    "wbthomason/packer.nvim",

    -- TELESCOPE
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.2",
        -- or                            , branch = "0.1.x",
        dependencies = { { "nvim-lua/plenary.nvim" } }
    },

    -- PRETTY TROUBLES
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = false,
                -- your configuration comes here
                -- or leave it empty to  the default settings
                -- refer to the configuration section below
            }
        end
    },

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },

    -- TREESITTER
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
    "nvim-treesitter/playground",
    "nvim-treesitter/nvim-treesitter-context",

    -- HARPOON
    "theprimeagen/harpoon",

    -- UNDOTREE
    "mbbill/undotree",

    -- GIT
    "tpope/vim-fugitive",
    "lewis6991/gitsigns.nvim",

    -- Autopairs ",",(,{,[...
    "windwp/nvim-autopairs",

    -- LSP
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        }
    },

    -- Comment blocks
    {
        "numToStr/Comment.nvim",
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring"
        }
    },

    -- LUALINE
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", opt = true }
    },

    -- GLOW (markdown)
    {
        "ellisonleao/glow.nvim",
        ft = "markdown"
    },

    -- ZEN MODE
    "folke/zen-mode.nvim",

    -- TMUX
    "christoomey/vim-tmux-navigator",

    -- COLORS
    "NvChad/nvim-colorizer.lua",

    -- COLORSCHEMES
    {
        "catppuccin/nvim",
        name = "catppuccin"
    },
    {
        "rose-pine/neovim",
        name = "rose-pine"
    }

}

local opts = {}

require("lazy").setup(plugins, opts)
