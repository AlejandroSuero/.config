local colorscheme = require("aome.colorschemes." .. vim.g.colorscheme)
return {
    "nvim-tree/nvim-web-devicons",
    opts = {
        gql = {
            icon = "󰡷",
            color = colorscheme.pink,
            cterm_color = "199",
            name = "GraphQL",
        },

        http = {
            icon = "",
            color = colorscheme.blue,
            name = "Http",
        },

        default_icon = {
            icon = "󰈚",
            name = "Default",
        },

        c = {
            icon = "",
            name = "c",
        },

        css = {
            icon = "",
            name = "css",
        },

        dart = {
            icon = "",
            name = "dart",
        },

        deb = {
            icon = "",
            name = "deb",
        },

        Dockerfile = {
            icon = "",
            name = "Dockerfile",
        },

        html = {
            icon = "",
            name = "html",
        },

        jpeg = {
            icon = "󰉏",
            name = "jpeg",
        },

        jpg = {
            icon = "󰉏",
            name = "jpg",
        },

        js = {
            icon = "󰌞",
            name = "js",
        },

        kt = {
            icon = "󱈙",
            name = "kt",
        },

        lock = {
            icon = "󰌾",
            name = "lock",
        },

        lua = {
            icon = "",
            name = "lua",
            color = colorscheme.blue,
        },

        mp3 = {
            icon = "󰎆",
            name = "mp3",
        },

        mp4 = {
            icon = "",
            name = "mp4",
        },

        out = {
            icon = "",
            name = "out",
        },

        png = {
            icon = "󰉏",
            name = "png",
        },

        py = {
            icon = "",
            name = "py",
        },

        ["robots.txt"] = {
            icon = "󰚩",
            name = "robots",
        },

        toml = {
            icon = "",
            name = "toml",
        },

        ts = {
            icon = "󰛦",
            name = "ts",
        },

        tsx = {
            icon = "󰜈",
            color = colorscheme.blue,
            name = "tsx",
        },

        ttf = {
            icon = "",
            name = "TrueTypeFont",
        },

        rb = {
            icon = "",
            name = "rb",
        },

        rpm = {
            icon = "",
            name = "rpm",
        },

        vue = {
            icon = "󰡄",
            name = "vue",
        },

        woff = {
            icon = "",
            name = "WebOpenFontFormat",
        },

        woff2 = {
            icon = "",
            name = "WebOpenFontFormat2",
        },

        xz = {
            icon = "",
            name = "xz",
        },

        zip = {
            icon = "",
            name = "zip",
        },
    },
    config = function(_, opts)
        require("nvim-web-devicons").set_icon(opts)
    end,
    event = { "BufReadPre", "BufNewFile" },
}
