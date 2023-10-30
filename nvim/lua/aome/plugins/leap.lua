return {
    "ggandor/leap.nvim",
    event = { "BufReadPre", "BufNewFile" },
    lazy = true,
    config = function(_, _)
        require("leap").add_default_mappings()
    end,
}
