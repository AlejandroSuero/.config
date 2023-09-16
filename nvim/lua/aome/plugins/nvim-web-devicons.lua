return {
    "nvim-tree/nvim-web-devicons",
    config = function()
        require("nvim-web-devicons").set_icon({
            gql = {
                icon = " ",
                color = "#e535ab",
                cterm_color = "199",
                name = "GraphQL",
            },
            http = {
                icon = " ",
                color = require("aome.colorschemes.catppuccin").blue,
                name = "Http",
            },
        })
    end,
    lazy = true,
}
