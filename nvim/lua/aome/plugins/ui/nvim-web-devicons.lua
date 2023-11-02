local base46 = require("base46")
local colorscheme = base46.get_colors("base46", vim.g.colorscheme)
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
            color = colorscheme.blue,
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
            color = colorscheme.orange,
        },

        jpeg = {
            icon = "󰉏",
            name = "jpeg",
            color = colorscheme.green,
        },

        jpg = {
            icon = "󰉏",
            name = "jpg",
            color = colorscheme.green,
        },

        js = {
            icon = "󰌞",
            name = "js",
            color = colorscheme.yellow,
        },

        jsx = {
            icon = "󰌞",
            name = "jsx",
            color = colorscheme.yellow,
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
            color = colorscheme.green,
        },

        mp4 = {
            icon = "",
            name = "mp4",
            color = colorscheme.green,
        },

        out = {
            icon = "",
            name = "out",
        },

        png = {
            icon = "󰉏",
            name = "png",
            color = colorscheme.green,
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
            color = colorscheme.blue,
        },

        tsx = {
            icon = "󰜈",
            color = colorscheme.nord_blue,
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
