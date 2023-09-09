return {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    ft = {
        "html",
        "javascriptreact",
        "typescriptreact",
        "jsx",
        "tsx",
        "astro",
        "svelte",
    },
}
